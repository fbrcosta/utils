require './logging/logger/ml-logger.rb'
require './logging/logger-policies/log-policies.rb'
require './logging/logger-aspects/logger-aspects.rb'

class Logging

	# default logger is a media lab logger
	@@logger = MLLogger.new

	def self.Logger= (log)
		@@logger = log
	end

	def self.Logger
		return @@logger
	end


	# log policies 
	@@log_policies = LogPolicies.new

	def self.EnableLogPolicies
		@@log_policies.enable
	end

	def self.DisableLogPolicies
		@@log_policies.disable
	end

	def self.Policies(&block)
		LoggerPolicies.instance.policies(&block)
	end

	def self.PoliciesFilePath=(path)
		load path
	end


	# log aspects
	@@log_aspects = LoggerAspects.instance

	def self.EnableLogAspects
		@@log_aspects.enable
	end

	def self.DisableLogAspects
		@@log_aspects.disable
	end

	def self.Aspects(&block)	
		@@log_aspects.aspectsl(&block)
	end



end