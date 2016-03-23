
require './idle-state.rb'

class TimerContext

	# def initialize()
	# 	@mutex = Mutex.new
	# 	# @state = IdleState.new
	# 	# @state.run(self)
	# 	stateTransition(IdleState.new)

	# 	@events_queue = Queue.new
	# 	start_events_consumer
	# end

	# def onStartTimer(seconds)
	# 	addEvent(:onStartTimer, seconds)
	# end

	# def onCancelTimer()
	# 	addEvent(:onCancelTimer)
	# end

	# def onFinishTimer()
	# 	addEvent(:onFinishTimer)
	# end

	# def onTimeFinished()
		
	# end

	# def stateTransition(state)
	# 	@state = state
	# 	@state.run(self)
	# end

	# def getState
	# 	return @state
	# end

	# private def addEvent(method, *params)
	# 	puts "[EVENT]: |state #{@state.to_str}| #{method}"
	# 	@events_queue.push({"method" => method,"params" => params})
	# end

	# private def start_events_consumer
		
	# 	@consumer_thread = Thread.new do
	# 		while true
	# 			begin
	# 				event = @events_queue.pop
	# 				@mutex.synchronize do
	# 					@state.method(event["method"]).call(self, *event['params'])
	# 				end
	# 			rescue Exception => ex
	# 				puts "Exception: #{ex}"
	# 			end
	# 		end
	# 	end
		
	# end

end