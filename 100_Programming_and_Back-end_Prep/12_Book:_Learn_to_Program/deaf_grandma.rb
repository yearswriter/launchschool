#"touch deaf_grandma.rb", *nix, you are silly.
puts "You see your dear Grandma sitting in the chair before you,
thinking about something.\n"
told_you_bye=0
while true
  year = rand(70)+13
  answer=gets.chomp
  if answer!=answer.upcase   
    told_you_bye=0
    puts "huh?! speak up, sonny!".upcase
  elsif (answer.include? "HI") || (answer.include? "HELLO")   
    told_you_bye=0
    puts "Hi, honey!".upcase
  elsif answer.include? 'bye'.upcase
    told_you_bye+=1
    puts "HUH?"
    if told_you_bye==3
      puts "already? well that is a shame. bye honey!".upcase
      break
    end
  else
    told_you_bye=0
    puts "no, not since 19#{year}".upcase
  end
end
#kinda mess