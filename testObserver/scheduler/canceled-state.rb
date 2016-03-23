require './timer-state.rb'

class CanceledState < TimerState

	def initialize(thread)
		super()
		@thread = thread
	end

	def run(context)
		@thread.exit
		puts "Timer Canceled"
	end

	def to_str
		return "CANCELED"
	end

end