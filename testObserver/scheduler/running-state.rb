
require './timer-state.rb'
require './finished-state.rb'
require './canceled-state.rb'

class RunningState < TimerState

	def initialize(seconds)
		super()
		@seconds = seconds
	end

	def run(context)
		@thread = Thread.new {
			sleep(@seconds)
			context.onFinishTimer()
		}
	end

	def onCancelTimer(context)
		context.stateTransition(CanceledState.new(@thread))
	end

	def onFinishTimer(context)
		context.stateTransition(FinishedState.new)
	end

	def to_str
		return "RUNNING"
	end

end

