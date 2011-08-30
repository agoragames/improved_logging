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
  
  it 'should call #add when you log a message' do
    @logger.should_receive(:add).with(0, 'message', nil)
    
    @logger.debug('message')
  end
  
  it 'should allow you to pass an exception to the error method' do
    @logger.should_receive(:error).with('message', anything())
    
    begin
      raise StandardError.new
    rescue => e
      @logger.error('message', e)
    end
  end

  it 'should allow you to pass an exception to the warn method' do
    @logger.should_receive(:warn).with('message', anything())
    
    begin
      raise StandardError.new
    rescue => e
      @logger.warn('message', e)
    end
  end
end