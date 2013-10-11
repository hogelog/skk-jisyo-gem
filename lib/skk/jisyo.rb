require "skk/jisyo/version"
require "open-uri"

JISYO_URL = "http://openlab.ring.gr.jp/skk/skk/dic"
JISYO_DIR = File.expand_path("../../../jisyo", __FILE__)

module Skk
  module Jisyo
    def self.path(suffix = "L")
      "#{JISYO_DIR}/SKK-JISYO.#{suffix}"
    end

    def self.update(suffix = "L")
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
