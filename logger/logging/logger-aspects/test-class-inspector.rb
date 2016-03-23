
require 'aspector'
require './logging/logger-aspects/logger-aspect.rb'
require './logging/logging.rb'

class TestClassInspector < LogAspect

	def createAspect
		aspect = Aspector do 
			around /isBiggerThanTen\?/, except: :class, method_arg: true do |method, proxy, *args, &block|
				log = "#{self.class}"
				mehtod = "#{method}"
				params = "#{args.join(', ')}"

				*result = proxy.call(*args, &block)
				results = "#{result.join(', ')}"

				if result[0] == false
					Logging.Logger.error("Error: #{result[1]}", log, method)
				end
				return result
			end # around
		end # aspector

		return aspect
	end 

end
