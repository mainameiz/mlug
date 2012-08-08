class CommentPresenter < BasePresenter
  presents :comment
  delegate :author, to: :comment

  def id
    if comment.new_record?
      "new_comment"
    else
      "comment_#{comment.id}"
    end
  end

  def link_to_comment
    h.link_to '#', h.post_path(comment.post_id, anchor: id)
  end

  def actions
    if h.can?(:replay, comment)
      if comment.new_record?
        h.link_to h.t('replay'), '#'
      else
        h.link_to h.t('replay'), h.post_comment_path(comment.post, comment)
      end
    end
  end

  def text
    h.showdown_markdown(comment.text, false) unless comment.text.blank?
  end

  def replay_form(new_comment)
    if h.can? :replay, comment
      h.render partial: 'comments/replay_form', locals: { comment: comment, new_comment: new_comment, post: comment.post }
    end
  end
end
