require './logging/logger-aspects/logger-aspect.rb'

class LoggerAspects

	##### singleton

	@@instance = nil

	def self.instance 
		if @@instance == nil
			@@instance = new
		end
		return @@instance
	end

	##### object

	def initialize
		@aspects = {}
		@enabled = false
	end

	def addAspect(_aspect, _class)
		value = false

		if @aspects.has_key?(_aspect) == false
			@aspects[_aspect] = Array.new
			@aspects[_aspect].push(_class)
			value = true
		elsif @aspects[_aspect].include?(_class) == false
			@aspects[_aspect].push(_class)
			value = true
		end

		if @enabled == true
			_aspect.install(_class)
		end

		return value
	end

	def removeAspect(_aspect, _class = nil)

		if @aspects.has_key?(_aspect) == false
			return false
		end

		if _class == nil
			@aspects[_aspect].each do |_class|
				if @enabled == true
					_aspect.uninstall(_class)
				end
			end
			@aspects.delete(_aspect)
		else
			if @enabled == true
				_aspect.uninstall(_class)
			end
			@aspects[_aspect].delete(_class)
			if @aspects[_aspect].empty? == true
				@aspects.delete(_aspect)
			end
		end

		return true
	end

	# Enables the logger aspects. (installs the aspects on the classes)
	def enable
		# if already enabled, nothing to do
		if @enabled == true
			return false
		end

		# for each aspect, install in the class
		@aspects.each do |_aspect, arr|
			arr.each do |_class|
				_aspect.install(_class)
			end
		end
		@enabled = true

		return true
	end

	# Disables the logger aspects. (uninstalls the aspects on the classes)
	def disable
		# if already disabled, nothing to do
		if @enabled == false
			return false
		end

		# for each aspect, uninstall in the class
		@aspects.each do |_aspect, arr|
			arr.each do |_class|
				_aspect.uninstall(_class)
			end
		end
		@enabled = false

		return true
	end

	def aspects(&block)
		instance_exec(&block)
	end

	def add(component)
		key = component.keys[0]
		addAspect(key, component[key])
	end

end