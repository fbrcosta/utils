require './logging/logger/base-logger.rb'

class MLLogger < BaseLogger

	##### parameters

	# name of the log
	DEFAULT_LOGGER_PATH = "mllogger.log"

	# max log size
	DEFAULT_MAX_SIZE = 10 * 1024**2 # 10 MiB

	##### object

	attr_accessor :log_path
	attr_accessor :max_size

	def initialize()
		super
		@log_path = DEFAULT_LOGGER_PATH
		@max_size = DEFAULT_MAX_SIZE
	end
	
	def log_msg(level, message, log, method)
		file = File.open(@log_path,"a")

		message = "[%s] %s %s#%s: %s\n" % [level.to_s, 
			Time.now.strftime(@ts_type), log, method, message]
		file.write(message)

		file.close
	end

end
