module ApplicationHelper
  def with_new_comment_for(post)
    post.comments.build unless(post.comments.detect(&:new_record?))

    return post
  end
end
