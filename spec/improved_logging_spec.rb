require 'spec_helper'
require 'active_support/core_ext/module'
require 'active_support'
require 'improved_logging'

describe ActiveSupport::BufferedLogger do
  let(:output) {
    StringIO.new
  }
  
  let(:logger) {
    ActiveSupport::BufferedLogger.new(output)
  }
  
  it 'should include the ImprovedLogging module' do
    ActiveSupport::BufferedLogger.included_modules.should include(::ImprovedLogging)
    logger.methods.should include(:add_with_extra_info)
  end
end