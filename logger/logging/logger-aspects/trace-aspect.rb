
require 'aspector'
require './logging/logger-aspects/logger-aspect.rb'
require './logging/logging.rb'

class TraceAspect < LoggerAspect

	def createAspect
		puts "creating"

		aspect = Aspector do 
			around /.*/, except: :class, method_arg: true do |method, proxy, *args, &block|
				log = "#{self.class}"
				mehtod = "#{method}"
				params = "#{args.join(', ')}"

				Logging.Logger.trace("[Enter] arguments: (#{params})", log, method)
				*result = proxy.call(*args, &block)
				results = "#{result.join(', ')}"

				Logging.Logger.trace("[Exit] return: (#{results})", log, method)
				return result
			end # around

		end # aspector

		return aspect
	end

end
