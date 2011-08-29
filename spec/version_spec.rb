require 'spec_helper'
require 'improved_logging/version'

describe ImprovedLogging do
  it "should be the correct version" do
    ImprovedLogging::VERSION.should == '0.0.1'
  end
end