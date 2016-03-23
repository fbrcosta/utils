require './timer-state.rb'

class FinishedState < TimerState

	def run(context)
		context.onTimeFinished
	end

	def to_str
		return "FINISHED"
	end

end