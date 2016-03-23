


class TaskScheduler

	def initialize
		@scheduled_tasks = {}
	end

	def sheduleTask(time, taskid)

		if @scheduled_tasks.has_key?(taskid) == true
			return false, "Task already scheduled."
		end

		seconds = time.utc - Timer.now.utc

		if seconds < 0 
			return false, "Cannot schedule task in the past."
		elsif seconds < 5
			return false, "The task must be scheduled at least 5 seconds from " + 
				"actual time"
		end

		@scheduled_tasks[taskid] = Timer.new(seconds)
		#@scheduled_tasks[taskid].addObserver(self)
		@scheduled_tasks[taskid].start

		return true

	end

	def cancelTask(taskid)

		if @scheduled_tasks.has_key?(taskid) == false
			return false, "Task doesn't exist."
		end

		@scheduled_tasks[taskid].cancel
		@scheduled_tasks.delete(taskid)

		return true

	end

end