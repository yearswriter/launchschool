time_of_start = Time.now
i=0
s="This will keep printing until you hit Ctrl + c"
loop do
    i=i+1
    time_of_curent_loop = Time.now
    diff =time_of_curent_loop - time_of_start
    puts "#{diff}s #{s*i}"
end
#answer - a lot, string is an object, so it is bigger than just ACII chars, but still not much