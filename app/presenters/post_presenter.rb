class PostPresenter < BasePresenter
  presents :post

  def comments
    h.answers_for(post)
  end

  def title
    post.title
  end

  def author
    h.link_to post.author.email, h.user_profile_path(post.author)
  end

  def body
    h.showdown_markdown(post.body, false)
  end

  def actions
    if h.can? :edit, post
      h.link_to h.t('edit'), h.edit_post_path(post)
    end
  end

  def replay_form(comment_presenter)
    if h.can? :replay, Post
      h.render partial: 'posts/replay_form', locals: { post: post, comment_presenter: comment_presenter }
    end
  end

  def create_link(f)
    f.submit
  end

  def preview_link(f)
    f.submit h.t('preview'), name: 'preview', class: 'preview_button', data: { edit_text: h.t('edit') }
  end
end
