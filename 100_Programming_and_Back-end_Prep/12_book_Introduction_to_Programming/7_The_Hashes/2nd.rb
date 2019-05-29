#unmutable
list={this_is: 'list'} #hash #1"
dict={and_this_is: 'dict'} #hash #2"
p "#{list} #hash #1 #{dict} #hash #2"
p "#{list.merge(dict)} ---------:merged hash"
p "#{list} -------#{dict}--------:original hashes still intact"
#mutable
p "#{hash=list.merge!(dict)} ---------:merge!d hash"
p "#{list} -------#{dict} --------:original hashes are mutated"
