## 
# Defines the Timer State class
# This is a pure abstract class

class TimerState

	## 
	# TimerState constructor.
	def initialize
		# nothing to do here
	end

	## 
	# When the state transists to the current state, it will run this code.
	# Params:
	# +context+:: the context for the state.
	def run(context)
		# nothing to do here
	end

	## 
	# Function performed when onStartTimer event is received.
	# Params:
	# +context+:: the context for the state.
	def onStartTimer(context, seconds)
		# nothing to do here
	end

	##
	# Function performed when onCancelTimer event is received.
	# Params:
	# +context+:: the context for the state.
	def onCancelTimer(context)
		# nothing to do here
	end

	##
	# Function performed when onFinishTimer event is received.
	# Params:
	# +context+:: the context for the state.
	def onFinishTimer(context)
		# nothing to do here
	end

	##
	# Returns the state name.
	def to_str
		# nothing to do here
	end

end