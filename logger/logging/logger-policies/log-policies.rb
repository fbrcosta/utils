require 'aspector'
require './logging/logger-policies/logger-policies.rb'
require './logging/logger/base-logger.rb'

class LogPolicies

	def initialize

		@enabled = false

		@aspect = Aspector do 
			around :log_impl, method_arg: true do | method, proxy, *args, &block|
				_class = args[2]
				level = args[0]
				if LoggerPolicies.instance.hasPolicy?(_class, level) == false
					puts "Logging '%s' at level '%s' not permitted. " % 
						[_class, level.to_s("e")]
				else
					return proxy.call(*args, &block)
				end
			end
		end

	end

	def enable
		if @enabled == true
			return false
		end

		@aspect.apply(BaseLogger, private_methods: true)
		@enabled = true

		return true
	end

	def disable
		if @enabled == false
			return false
		end

		@aspect.disable(BaseLogger)
		@enabled = false

		return true
	end

	def isEnabled?
		return @enabled
	end

end