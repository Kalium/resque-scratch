module Jobs
  module Test
    class Dummy
      def self.perform(post_id)
        STDOUT.puts "GOT: #{post_id}..."
        post = Post.find(post_id)
        STDOUT.puts "TITLE: '#{post.title}'"
      end
    end
  end
end
