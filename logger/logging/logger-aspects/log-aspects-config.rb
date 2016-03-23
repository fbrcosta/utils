
require './logging/logger-aspects/trace-aspect.rb'

LogAspects.instance.aspects do

	install TraceAspect => TestClass
#	install(TestClassInspector,TestClass)

end
