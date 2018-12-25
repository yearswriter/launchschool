puts x="Yeah! Try to _stop_ me!" #I am doing this like this cause I can!
while x!="STOP"
  x=gets.chomp.upcase
  puts x=="STOP" ? "I mean doing this other way just rubs me wrong,\n" +
                    "you do know magic word, but while will still\n" +
                    "run at least once" : "#{x} is not a magic word"
end