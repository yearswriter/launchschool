class Test (@intro="
         Hello, and thank you for participation!
         We are going to ask you few questions:",
        psy_test = {filler_qq:        "Do you like eating",
                    filler_q_snippet: ["tacos","burritos","chimichangas",
                                      "sopapillas","horchata","flautas"],
                    actual_questions: ["Do you wet the bed? (yes\\no)", false]})
=begin The idea is to keep all variables in those to, 
everything else is "standart" formatting, so it could
 be any filler construct with actual hand-crafted questions
=end

  def initialize
  @intro=intro
  @psy_test=psy_test
  end
  
  def ask             
    puts intro                                          #| Basicly, 
    print "<"                                           #| pretty
    intro.split("\n").last.length.to_i.times{print "-"} #| HTML-like
    puts ">"                                            #| <hz>-alike
    filler_qq_complete =[] 
    result=[]
  
    psy_test[:filler_q_snippet].each do |qq|
      filler_qq_complete.push("#{@psy_test[:filler_qq]} #{qq} (yes\\no)?")
    end
  
    until filler_qq_complete.empty?
      filler_qq_complete.compact!
      filler_qq_index = rand(filler_qq_complete.length)
      if filler_qq_index/(rand(3)+1)==0
        puts psy_test[:actual_questions][0]
        answer = !!gets.chomp
        if answer=='yes'
          psy_test[:actual_questions][1]=true
        else
          psy_test[:actual_questions][1]=false
        end
      result.push psy_test.fetch(:actual_questions)
    end 
    puts filler_qq_complete[filler_qq_index]
    filler_qq_complete.delete_at(filler_qq_index)
    answer = !!gets.chomp    
    end
  end
  def result
    puts result
    return result
  end
end
qq = Test.new
qq.ask
qq.result
#I do not comprehend something, it still does not returns me result even 
# when I directly told it to do so 