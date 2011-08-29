require 'active_support'
require 'improved_logging/improved_logging'

ActiveSupport::BufferedLogger.send(:include, ImprovedLogging)