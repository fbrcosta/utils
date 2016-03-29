
require './timer-state.rb'

## 
# Defines the Finished state class for the Timer State class.
# Timer state transits to Finished state when onFinishTimer event is received.

class FinishedState < TimerState

	## 
	# FinishedState constructor.
	def initialize()
		# super()
	end

	## 
	# When the state transists to the Finished state, it will run this code.
	# Params:
	# +context+:: the context for the state.
	def run(context)
		context.onTimerFinished
	end

	##
	# Returns the state name.
	def to_str
		return "FINISHED"
	end

end