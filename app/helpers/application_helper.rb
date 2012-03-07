module ApplicationHelper
  def with_new_comment_for(post)
    post.comments.build

    return post
  end
end
