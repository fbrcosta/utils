require './subject.rb'

class Test

	include Subject

	def initialize
		super()

	end

	def doSomething()
		puts "doing something"
		notifyObservers
	end

end