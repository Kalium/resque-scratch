class Post < ActiveRecord::Base
  after_save do
    after_transaction do
      Resque::Job.create("my_queue", "Jobs::Test::Dummy", id)
    end
  end
end
