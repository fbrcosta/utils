
require './timer-state.rb'

## 
# Defines the Canceled state class for the Timer State class.
# Timer state transits to Canceled state when onCancelTimer event is received.

class CanceledState < TimerState

	##
	# CanceledState constructor.
	# Params:
	# +thread+:: the thread that is running the timer.
	def initialize(thread)
		# super()
		@thread = thread
	end

	## 
	# When the state transists to the Canceled state, it will run this code.
	# Params:
	# +context+:: the context for the state.
	def run(context)
		@thread.exit
		context.onTimerCanceled
	end

	## 
	# Returns the state name.
	def to_str
		return "CANCELED"
	end

end
