

class LoggerAspect

	def initialize
		puts "initializing"
		@aspect = createAspect
	end

	def install(_class)
		@aspect.apply(_class, private_methods: true)
	end

	def uninstall(_class)
		@aspect.disable(_class)
	end
end