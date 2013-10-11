require 'spec_helper'

describe Skk::Jisyo do
  include Skk::Jisyo

  it 'should have a version number' do
    Skk::Jisyo::VERSION.should_not be_nil
  end

  describe ".path" do
    context "with no params" do
      it "returns SKK-JISYO path" do
        expect(path).to end_with("SKK-JISYO.L")
      end
    end

    context "with suffix params" do
      it "returns SKK-JISYO.suffix path" do
        expect(path("jinmei")).to end_with("SKK-JISYO.jinmei")
      end
    end
  end
end
