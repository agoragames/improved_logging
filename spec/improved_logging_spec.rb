require 'spec_helper'
require 'active_support/core_ext/module'
require 'active_support'
require 'improved_logging'

describe ActiveSupport::BufferedLogger do
  
  before(:each) do
    @logger = ActiveSupport::BufferedLogger.new(StringIO.new)
  end
  
  it 'should include the ImprovedLogging module' do
    ActiveSupport::BufferedLogger.included_modules.should include(::ImprovedLogging)
    @logger.methods.should include(:add_with_extra_info)
    @logger.methods.should include(:error_with_exception_param)
    @logger.methods.should include(:warn_with_exception_param)    
  end
end