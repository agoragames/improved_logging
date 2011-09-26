require 'spec_helper'
require 'improved_logging/version'

describe ImprovedLogging do
  it "should be the correct version" do
    ImprovedLogging::VERSION.should == '1.0.2'
  end
end