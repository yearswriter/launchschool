class Test 
=begin The idea is to keep all variables in those to, 
everything else is "standart" formatting, so it could
 be any filler construct with actual hand-crafted questions
=end
  
  def initialize(intro="  Hello, and thank you for participation!\nWe are going to ask you few questions:",
                 psy_test ={filler_qq:        "Do you like eating",
                            filler_q_snippet: ["tacos","burritos","chimichangas",
                                                "sopapillas","horchata","flautas"],
                            actual_questions: ["Do you wet the bed? (yes\\no)", false]})
    @intro=intro
    @psy_test=psy_test
    @result=[]
  end
  
  def ask             
    puts @intro                                          #| Basicly, 
    print "<"                                           #| pretty
    @intro.split("\n").last.length.to_i.times{print "-"} #| HTML-like
    puts ">"                                            #| <hz>-alike
    filler_qq_complete =[]  
    @psy_test[:filler_q_snippet].each do |qq|
      filler_qq_complete.push("#{@psy_test[:filler_qq]} #{qq} (yes\\no)?")
    end  
    until filler_qq_complete.empty?
      filler_qq_complete.compact!
      filler_qq_index = rand(filler_qq_complete.length)
      if filler_qq_index/(rand(3)+1)==0
        puts @psy_test[:actual_questions][0]
        answer = !!gets.chomp
        if answer=='yes'
          @psy_test[:actual_questions][1]=true
        else
          @psy_test[:actual_questions][1]=false
        end
      @result.push @psy_test.fetch(:actual_questions)
    end 
    puts filler_qq_complete[filler_qq_index]
    filler_qq_complete.delete_at(filler_qq_index)
    answer = !!gets.chomp    
    end
  return @result
  end
end
qq = Test.new
result = qq.ask
puts "here is what mattered"
result.each {|a,q| puts "#{a} : #{q}"}