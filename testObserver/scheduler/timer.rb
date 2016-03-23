
require './idle-state.rb'

class Timer
	# include TimerObserverable

	def initialize(seconds)
		@seconds = seconds

		@mutex = Mutex.new

		@state = nil
		stateTransition(IdleState.new)

		@events_enabled = true
		@events_queue = Queue.new
		start_events_consumer
	end

	def start()
		addEvent(:onStartTimer, @seconds)
	end

	def cancel()
		addEvent(:onCancelTimer)
	end

	def currentState
		return @state.to_str
	end

#####################################

	def stateTransition(state)
		@state = state
		@state.run(self)
	end

	def onFinishTimer()
		addEvent(:onFinishTimer)
	end

	def onTimeFinished()
		# puts "ASDASDASDA SDASDA DSADSA WEEEEEEEEEEEEE"
		# observer.notifyTimeFinished(self)
	end


#####################################

	private def addEvent(method, *params)
		## puts "[EVENT]: |state #{@state.to_str}| #{method}"
		@events_queue.push({"method" => method,"params" => params})
	end

	private def start_events_consumer

		@consumer_thread = Thread.new do
			while @events_enabled == true
				begin
					event = @events_queue.pop
					@mutex.synchronize do
						@state.method(event["method"]).call(self, *event['params'])
					end
				rescue Exception => ex
					puts "Exception: #{ex}"
				end
			end
		end
		
	end

	private def stop_events_consumer
		@events_enabled = false
		@consumer_thread.exit
	end

end