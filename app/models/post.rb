class Post < ActiveRecord::Base
  validates :title, presence: true
  has_many :comments

  accepts_nested_attributes_for :comments, allow_destroy: true

  after_initialize do
    logger.debug("after_initialize")
    if(self.new_record?)
      logger.debug("after_initialize>new_record")
      self.title = "My Default Title" if(self.title.blank?)
    end
  end

  before_validation do
    logger.debug("before_validation: #{self.changed_attributes.keys}")
  end
  after_validation do
    logger.debug("after_validation")
  end

  before_create do
    logger.debug("before_create")
  end
  after_create do
    logger.debug("after_create")
  end

  before_save do
    logger.debug("before_save")
    if(self.changed_attributes.include?("title"))
      logger.debug("before_save>changed_attributes['title']")
      self.title = self.title + " 012345" unless(self.title =~ /\d+$/)
    end
  end
  after_save do
    logger.debug("after_save")
    after_transaction do
      logger.debug("after_save>after_transaction")
      Resque::Job.create("my_queue", "Jobs::Test::Dummy", id)
    end
  end
end
