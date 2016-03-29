
require './timer-state.rb'
require './running-state.rb'

## 
# Defines the Idle state class for the Timer State class.
# Timer state transits to Idle state when Timer is created.

class IdleState < TimerState

	## 
	# IdleState constructor.
	def initialize()
		# super()
	end

	## 
	# When the state transists to the Idle state, it will run this code.
	# Params:
	# +context+:: the context for the state.
	def run(context)
		context.onTimerCreated
	end

	## 
	# Function performed when onStartTimer event is received.
	# Params:
	# +context+:: the context for the state.
	# +seconds+:: the seconds until timer finishes.
	def onStartTimer(context, seconds)
		# transit to Running state
		context.stateTransition(RunningState.new(seconds))
	end

	## 
	# Returns the state name.
	def to_str
		return "IDLE"
	end

end