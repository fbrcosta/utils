
require './test-class.rb'
#require './logging/logger/ml-logger.rb'

#require './logging/logger-policies/logger-policies.rb'
#include LogPolicies

#require './logging/logger-aspects/logger-aspects.rb'
#include LoggerAspects

require './logging/logging.rb'

require './logging/logger-aspects/trace-aspect.rb'

def configure_logger

	### set type of logger
	# Logging.Logger = MLLogger.new

	### set logger path
	# Logging.Logger.log_path = "12345.log"

	### set logger max size
	# Logging.Logger.max_size = 1 * 1024**l2 # 1 MiB

	### set logger ts type
	# Logging.Logger.ts_type = '%m/%d %H:%M:%S'

	### enable politics
	# Logging.EnableLogPolicies

	### set log politics
	# Logging.Policies do
	# 	add "main.rb" => LogLevel.DEBUG
	# end

	### set log politics path
	# Logging.PoliciesFilePath = "policies.rb"

	### enable log aspects 
	Logging.EnableLogAspects

	### set log aspects
	Logging.Aspects do
		add TraceAspect => TestClass
	end

	### set aspects config file

end



class Main

	def initialize

		element = TestClass.new
		element.function(44, 55)
		element.function2("coisa")
		Logging.Logger.info("Test message")

	end

end

configure_logger

main = Main.new