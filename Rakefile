require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'skk/jisyo'

namespace :jisyo do
  desc "Update SKK-JISYO files."
  task :update do |task, args|
    %w(L jinmei station propernoun).each do |suffix|
      Skk::Jisyo.update(suffix)
    end
  end
end
