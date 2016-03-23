class LogLevel

	# types of messages of the log
	TRACE 	= 0x01 # TRACE LEVEL
	T 			= TRACE
	DEBUG 	= 0x02 # DEBUG LEVEL
	D 			= DEBUG
	INFO		= 0x04 # INFO LEVEL
	I 			= INFO
	WARNING = 0x08 # WARNING LEVEL
	W 			= WARNING
	ERROR 	= 0x10 # ERROR LEVEL
	E 			= ERROR
	FATAL		= 0x20 # FATAL LEVEL
	F 			= FATAL

	ALL			= T | D | I | W | E | F # ALL LEVELS

	def self.TRACE
		return LogLevel.new(TRACE)
	end

	def self.DEBUG
		return LogLevel.new(DEBUG)
	end

	def self.INFO
		return LogLevel.new(INFO)
	end

	def self.WARNING
		return LogLevel.new(WARNING)
	end

	def self.ERROR
		return LogLevel.new(ERROR)
	end

	def self.FATAL
		return LogLevel.new(FATAL)
	end

	def self.ALL
		return LogLevel.new(ALL)
	end

	attr_reader :level

	def initialize(level)
		@level = level
	end

	def &(arg)
		if arg.is_a?(Numeric) == true
			return LogLevel.new(@level & arg)
		elsif arg.is_a?(LogLevel) == true
			return LogLevel.new(@level & arg.level)
		end
	end

	def |(arg)
		if arg.is_a?(Numeric) == true
			return LogLevel.new(@level | arg)
		elsif arg.is_a?(LogLevel) == true
			return LogLevel.new(@level | arg.level)
		end
	end

	def >(arg)
		if arg.is_a?(Numeric) == true
			return @level > arg
		elsif arg.is_a?(LogLevel) == true
			return @level > arg.level
		end
	end

	def <(arg)
		if arg.is_a?(Numeric) == true
			return @level < arg
		elsif arg.is_a?(LogLevel) == true
			return @level < arg.level
		end
	end

	def >=(arg)
		if arg.is_a?(Numeric) == true
			return @level >= arg
		elsif arg.is_a?(LogLevel) == true
			return @level >= arg.level
		end
	end

	def <=(arg)
		if arg.is_a?(Numeric) == true
			return @level <= arg
		elsif arg.is_a?(LogLevel) == true
			return @level <= arg.level
		end
	end

	def ==(arg)
		if arg.is_a?(Numeric) == true
			return @level == arg
		elsif arg.is_a?(LogLevel) == true
			return @level == arg.level
		end
	end

	def !=(arg)
		if arg.is_a?(Numeric) == true
			return @level != arg
		elsif arg.is_a?(LogLevel) == true
			return @level != arg.level
		end
	end

	def to_s(type = "s")
		name = getName
		name = name[0] if type == "s"
		
		return name
	end

	def getName
		case @level
		when T then return "TRACE"
		when D then return "DEBUG"
		when I then return "INFO"
		when W then return "WARNING"
		when E then return "ERROR"
		when F then return "FATAL"
		else return "UNKNOWN"
		end
	end

end