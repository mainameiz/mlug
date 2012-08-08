class PostPreviewPresenter < BasePresenter
  presents :post

  def author
  end

  def title
    h.link_to post.title, post, class: 'title'
  end

  def body
    h.showdown_markdown(post.body, true)
  end

  def actions
    h.render partial: 'welcome/post_actions', locals: { post: post }
  end

  def info
    h.render partial: 'welcome/post_info', locals: { post: post }
  end

  def read_more
    h.link_to h.t('read_more'), post
  end
end
