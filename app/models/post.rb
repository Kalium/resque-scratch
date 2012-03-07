class Post < ActiveRecord::Base
  after_save do
    Resque::Job.create("my_queue", "Jobs::Test::Dummy", id)
  end
end
