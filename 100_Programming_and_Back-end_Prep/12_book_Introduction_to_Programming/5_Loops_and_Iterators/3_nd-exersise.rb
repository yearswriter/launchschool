array=["borrr",'d',0.2345,true,false,nil,0,12234,[true,false],{this:'hash'},:symbol]
array.each_with_index {|thing,index| puts "index # #{index} stores \'#{thing}\' #{thing.class.to_s.downcase}."}