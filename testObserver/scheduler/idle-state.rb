
require './timer-state.rb'
require './running-state.rb'

class IdleState < TimerState

	def onStartTimer(context, seconds)
		context.stateTransition(RunningState.new(seconds))
	end

	def to_str
		return "IDLE"
	end

end