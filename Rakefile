require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

JISYO_URL = "http://openlab.ring.gr.jp/skk/skk/dic"
JISYO_DIR = File.expand_path("../jisyo", __FILE__)

namespace :jisyo do
  desc "Update SKK-JISYO files."
  task :update do |task, args|
    require "open-uri"

    %w(L jinmei station propernoun).each do |suffix|
      jisyo_name = "SKK-JISYO.#{suffix}"
      jisyo_url = "#{JISYO_URL}/#{jisyo_name}"
      jisyo_path = "#{JISYO_DIR}/#{jisyo_name}"
      File.open(jisyo_path, "wb") do |local_file|
        open(jisyo_url) do |remote_file|
          jisyo_data = remote_file.read
          local_file.write(jisyo_data)
          puts "#{jisyo_name}: #{jisyo_data.length} bytes (#{remote_file.last_modified})"
        end
      end
    end
  end
end
