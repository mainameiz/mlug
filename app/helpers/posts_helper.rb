module PostsHelper
  def answers_for(post_or_comment)
    render partial: 'posts/comment', collection: post_or_comment.answers
  end
end
