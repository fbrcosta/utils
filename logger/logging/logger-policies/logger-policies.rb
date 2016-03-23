
class LoggerPolicies

	@@instance = nil

	def self.instance
		if @@instance == nil
			@@instance = new
		end
		return @@instance
	end

	def initialize
		@logger_policies = {}
	end

	# Adds a log component
	# Params:
	# +_class+:: the class to add the 	log component
	# +log_level+:: the log level to add from the class
	def addPolicy(_class, log_level)
		key = _class.to_s

		if @logger_policies.has_key?(key) == true
			@logger_policies[key] |= log_level
		else
			@logger_policies[key] = log_level
		end
	end

	# Removes a log component
	# Params:
	# +_class+:: the class to revome the log component
	# +log_level+:: the log level to remove from the class
	def removePolicy(_class, log_level)
		key = _class.to_s

		if @logger_policies.has_key?(key) == true
			@logger_policies[key] &= ~log_level
		end
	end

	# Checks if the log is enabled for a component
	# Params:
	# +_class+:: the class to check if log is enabled
	# +log_level+:: the log level to check from the class
	def hasPolicy?(_class, log_level)
		key = _class.to_s
		value = false

		if @logger_policies.has_key?(key) == true &&
			@logger_policies[key] & log_level > 0
			value = true
		end

		return value
	end

	def policies(&block)
		instance_exec(&block)
	end

	def add(component)
		key = component.keys[0]
		addPolicy(key, component[key])
	end

end