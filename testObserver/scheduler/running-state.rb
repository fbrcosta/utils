
require './timer-state.rb'
require './finished-state.rb'
require './canceled-state.rb'

## 
# Defines the Running state class for the Timer State class.
# Timer state transits to Running state when onStartTimer event is received.

class RunningState < TimerState

	## 
	# RunningState constructor.
	# Params:
	# +seconds+:: the seconds until timer finishes.
	def initialize(seconds)
		# super()
		@seconds = seconds
	end

	## 
	# When the state transists to the Running state, it will run this code.
	# Params:
	# +context+:: the context for the state.
	def run(context)
		# send event
		context.onTimerStarted
		
		# start timer thread
		@thread = Thread.new {
			sleep(@seconds)
			context.onFinishTimer()
		}
	end

	## 
	# Function performed when onCancelTimer event is received.
	# Params:
	# +context+:: the context for the state.
	def onCancelTimer(context)
		# transit to Canceled state
		context.stateTransition(CanceledState.new(@thread))
	end

	## 
	# Function performed when onFinishTimer event is received.
	# Params:
	# +context+:: the context for the state.
	def onFinishTimer(context)
		# transit to Finished state
		context.stateTransition(FinishedState.new)
	end

	## 
	# Returns the state name.
	def to_str
		return "RUNNING"
	end

end

