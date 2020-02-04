require 'beaneater' #gem install beaneater 

@beanstalk = Beaneater.new(['localhost:11300'])
@tube = @beanstalk.tubes["tube"]
@tube.put 'hello', :pri => 5
@tube.put 'world', :delay => 3
while @tube.peek(:ready)
	  @job = @tube.reserve
	  puts @job.body # prints "hello"
	  @job.delete
end
@beanstalk.close
