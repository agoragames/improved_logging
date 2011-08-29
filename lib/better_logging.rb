require 'active_support'
require 'better_logging/better_logging'

ActiveSupport::BufferedLogger.send(:include, BetterLogging)