def roman_num inp
  num = String.new
  roman_sheet ={thousand: ['M',inp/1000],
                five_hun: ['D',inp%1000/500],
                hundred:  ['C',inp%1000%500/100],
                fifty:    ['L',inp%1000%500%100/50],
                ten:      ['X',inp%1000%500%100%50/10],
                five:     ['V',inp%1000%500%100%50%10/5],
                one:      ['I',inp%1000%500%100%50%10%5]}
  roman_sheet.each {|k,v| num+= v[0]*v[1]}
  return num
end
print "Which Roman number you wish to create: "
inp = gets.chomp.to_i
puts roman_num inp


def modern_roman_num inp  #https://en.wikipedia.org/wiki/Roman_numerals
  num = String.new
  roman_sheet =[['M',inp/1000],
                ['D',inp%1000/500],
                ['C',inp%1000%500/100],  
                ['L',inp%1000%500%100/50],
                ['X',inp%1000%500%100%50/10],
                ['V',inp%1000%500%100%50%10/5],
                ['I',inp%1000%500%100%50%10%5]]
  #..leaving alone thousands from our shenanigans, since there are no roman nums bigger
  num+= roman_sheet[0][0]*roman_sheet[0][1]
  index =1
  #..
  while index<roman_sheet.length
    if roman_sheet[index][1]<4
      num+= roman_sheet[index][0]*roman_sheet[index][1]
    elsif roman_sheet[index][1]%9==0
      num +=roman_sheet[index][0] + roman_sheet[index-1][0]
      index +=1
    else 
      num+= roman_sheet[index][0] + roman_sheet[index-1][0]
    end
    index +=1
  end
  return num
end
print "Which Roman number you wish to create: "
inp = gets.chomp.to_i
puts modern_roman_num inp