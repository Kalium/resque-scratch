#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

ResqueApp::Application.load_tasks

namespace :resque do
  task :load_worker => :environment do
    require './worker/jobs'
  end

  task :work => :load_worker
end

require 'resque/tasks'
