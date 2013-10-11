require "skk/jisyo/version"

JISYO_DIR = File.expand_path("../../../jisyo", __FILE__)

module Skk
  module Jisyo
    def path(suffix = "L")
      "#{JISYO_DIR}/SKK-JISYO.#{suffix}"
    end
  end
end
