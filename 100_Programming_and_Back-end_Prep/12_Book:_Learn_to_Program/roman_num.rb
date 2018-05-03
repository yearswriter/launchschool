def roman_num inp
  roman_sheet ={thousand: ['M',inp/1000],
                five_hun: ['D',inp%1000/500],
                hundred:  ['C',inp%1000%500/100],
                fifty:    ['L',inp%1000%500%100/50],
                ten:      ['X',inp%1000%500%100%50/10],
                five:     ['V',inp%1000%500%100%50%10/5],
                one:      ['I',inp%1000%500%100%50%10%5]}
  roman_sheet.each {|k,v| print v[0]*v[1]}
  puts
end
print "Which Roman number you wish to create: "
inp = gets.chomp.to_i
roman_num inp
def modern_roman_num inp  #https://en.wikipedia.org/wiki/Roman_numerals
  roman_sheet =['M',inp/1000,1000],
               ['D',inp%1000/500,500],
               ['C',inp%1000%500/100,100],
               ['L',inp%1000%500%100/50,50],
               ['X',inp%1000%500%100%50/10,10],
               ['V',inp%1000%500%100%50%10/5,5],
               ['I',inp%1000%500%100%50%10%5,1]
  i=0            
  while i < roman_sheet.length.to_i
    #print roman_sheet[i][0]*roman_sheet[i][1]
    if roman_sheet[i][1]>(roman_sheet[i-1][2]-roman_sheet[i][1])
      print roman_sheet[i][0]*(roman_sheet[i-1][2]-roman_sheet[i][1])
      print roman_sheet[i-1][0]*roman_sheet[i-1][1]
    else
      print roman_sheet[i][0]*roman_sheet[i][1]
    end
    i+=1
  end
  puts
end
print "Which Roman number you wish to create: "
inp = gets.chomp.to_i
modern_roman_num inp