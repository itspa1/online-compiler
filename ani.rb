fname = File.open("ani.txt","w")
$stderr = fname
$stdout = fname
string = "ani ani virat"
words = string.split(" " )
word_hash  = {}
words.uniq.each do |w|
  word_hash[w] = word.count(w)
end
puts word_hash
fname.close
