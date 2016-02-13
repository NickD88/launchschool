flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = flintstones.map.with_index { |v, i| [v, i]}.to_h
p flintstones_hash
