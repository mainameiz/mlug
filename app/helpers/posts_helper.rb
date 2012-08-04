module PostsHelper
  def comments_for(post)
    render(partial: 'comment', collection: post.comments.select { |comment|
      comment.parent.nil?
    })
  end
end
