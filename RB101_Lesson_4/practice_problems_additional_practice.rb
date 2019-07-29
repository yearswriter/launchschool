flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = {}
flintstones.each_with_index { | n, i | flintstones_hash[n] = i }
p flintstones_hash
