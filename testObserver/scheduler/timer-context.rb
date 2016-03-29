
require './idle-state.rb'

##
# Defines the Timer Context class. 
# This is in between the Timer class and the Timer State class.

class TimerContext

	## 
	# TimerContext contructor.
	def initialize(timer)
		# set timer
		@timer = timer

		# create semaphore for thread concurrency
		@mutex = Mutex.new

		# create queue for events
		@events_queue = Queue.new

		# start event consumer thread
		start_events_consumer

		# transit state to Idle state
		stateTransition(IdleState.new)
	end

###########################################################
# (Before) transition events

	## 
	# Starts the timer.
	# Params:
	# +seconds+:: the seconds until timer finishes.
	def onStartTimer(seconds)
		addEvent(:onStartTimer, seconds)
	end

	## 
	# Cancels the timer.
	def onCancelTimer()
		addEvent(:onCancelTimer)
	end

	## 
	# Finishes the timer.
	def onFinishTimer()
		addEvent(:onFinishTimer)
	end

###########################################################
# (After) transition events

	##
	# Event sent when timer is created.
	def onTimerCreated()
		@timer.onTimerCreated
	end

	##
	# Event sent when timer starts.
	def onTimerStarted()
		@timer.onTimerStarted
	end

	##
	# Event sent when timer cancels.
	def onTimerCanceled()
		@timer.onTimerCanceled
	end

	##
	# Event sent when timer finishes.
	def onTimerFinished()
		@timer.onTimerFinished
	end

###########################################################
# 

	
	def stateTransition(state)
		@state = state
		@state.run(self)
	end

	def getState
		return @state
	end

###########################################################
# Private functions

	private def addEvent(method, *params)
		@events_queue.push({"method" => method,"params" => params})
	end

	private def start_events_consumer
		
		@consumer_thread = Thread.new do
			while true
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

end