require './logging/logger/log-level.rb'

class BaseLogger

	##### parameters

	# timestamp format for the log
	DEFAULT_TS_TYPE = '%Y/%m/%d %H:%M:%S.%3N'

	##### object

	attr_accessor :ts_type

	def initialize
		@ts_type = DEFAULT_TS_TYPE
	end

	def trace(message, log = nil, method = nil)
		log(LogLevel.TRACE, message, log, method)
	end

	def debug(message, log = nil, method = nil)
		log(LogLevel.DEBUG, message, log, method)
	end

	def info(message, log = nil, method = nil)
		log(LogLevel.INFO, message, log, method)
	end

	def warning(message, log = nil, method = nil)
		log(LogLevel.WARNING, message, log, method)
	end

	def error(message, log = nil, method = nil)
		log(LogLevel.ERROR, message, log, method)
	end

	def fatal(message, log = nil, method = nil)
		log(LogLevel.FATAL, message, log, method)
	end

	def log(level, message, log = nil, method = nil)
		method = caller[1][/`.*'/][1..-2] if method == nil
		log = caller[1][/[^\/:]*:/][0..-2] if log == nil

		log_impl(level, message, log, method)
	end

	def log_impl(level, message, log, method)
		log_msg(level, message, log, method)
	end

	private :log_impl 
end
