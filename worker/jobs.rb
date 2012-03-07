Resque.after_fork do
  ActiveRecord::Base.establish_connection
end

require_relative 'jobs/test'
