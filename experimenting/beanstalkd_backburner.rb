require 'beaneater' #gem install beaneater 
beanstalk = Beaneater.new(['localhost:11300'])
tube = beanstalk.tubes["tube"]
tube.put 'hello', :delay => 20 
tube.put 'world'
#loop do
	  job = tube.reserve :timeout => 30
	  puts job.body # prints "hello"
          
