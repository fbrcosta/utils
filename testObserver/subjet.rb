
module Subject

	def initialize

		@observers = []

	end

	def addObserver(observer)
		@observers.push(observer)
	end

	def removeObserver(observer)
		@observers.delete(observer)
	end

	def notifyObservers
		@observers.each do |obs|
			observer.notify(self)
		end
	end

end