def roman_num inp
  roman_sheet ={thousand: ['M',inp/1000],
                five_hun: ['D',inp%1000/500],
                hundred:  ['C',inp%1000%500/100],
                fifty:    ['L',inp%1000%500%100/50],
                ten:      ['X',inp%1000%500%100%50/10],
                five:     ['V',inp%1000%500%100%50%10/5],
                one:      ['I',inp%1000%500%100%50%10%5]}
  roman_sheet.each {|k,v| print v[0]*v[1]}
end
print "Which Roman number you wish to create: "
inp = gets.chomp.to_i
roman_num inp
puts