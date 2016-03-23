require './timer.rb'
require 'aspector'

puts "Creating timer"
timer = Timer.new(2.9995)

traceAspect = Aspector do
	regex = /(run|onStartTimer|onCancelTimer|onFinishTimer)/

	around regex, except: :class, method_arg: true do |method, proxy, *args, &block|
		puts "[BEGIN] #{self.class}: #{method}"
		result = proxy.call(*args, &block)
		puts "[END] #{self.class}: #{method}"
		return result
	end

end

#traceAspect.apply(IdleState)
#traceAspect.apply(RunningState)
#traceAspect.apply(CanceledState)
#traceAspect.apply(FinishedState)

transitionAspect = Aspector do
	around /stateTransition/, except: :class, method_arg: true do |method, proxy, *args, &block|
		puts "[State Transition] #{timer.getState} to #{args[0].to_str}"
		result = proxy.call(*args, &block)
		return result
	end
end

#transitionAspect.apply(TimerContext)

puts "Starting timer"
timer.start

puts "Main thred to sleep"

sleep(3)
timer.cancel

sleep(10)
puts "Main thred waking"

puts "FINAL STATE: #{timer.currentState}"