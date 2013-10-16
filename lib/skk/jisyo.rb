require "skk/jisyo/version"
require "open-uri"
require "settingslogic"

module Skk
  module Jisyo
    JISYO_DIR = File.expand_path("../../../jisyo", __FILE__)

    class Settings < ::Settingslogic
      source "#{JISYO_DIR}/skk-jisyo.yml"
    end

    JISYO_URL = Settings.jisyo_url

    def self.url(suffix = "L")
      "#{JISYO_URL}/SKK-JISYO.#{suffix}"
    end

    def self.urls
      Settings.jisyo_list.map{|suffix| url(suffix) }
    end

    def self.path(suffix = "L")
      "#{JISYO_DIR}/SKK-JISYO.#{suffix}"
    end

    def self.paths
      Settings.jisyo_list.map{|suffix| path(suffix) }
    end

    def self.update(suffix = "L")
      local_path = path(suffix)
      local_timestamp_path = "#{local_path}.timestamp"
      local_timestamp = File.read(local_timestamp_path) if File.exists?(local_timestamp_path)

      open(url(suffix)) do |remote_file|
        remote_timestamp = remote_file.last_modified.to_s
        if local_timestamp != remote_timestamp
          jisyo_data = remote_file.read
          File.open(local_path, "wb") do |local_file|
            local_file.write(jisyo_data)
          end
          File.write(local_timestamp_path, remote_timestamp)
          puts "#{path(suffix)}: #{jisyo_data.length} bytes (#{remote_timestamp})"
        else
          puts "#{path(suffix)} is not modified (#{remote_timestamp})"
        end
      end
    end

    def self.update_all
      Settings.jisyo_list.each do |suffix|
        update(suffix)
      end
    end
  end
end
