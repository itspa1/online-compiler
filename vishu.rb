fname = File.open("vishu.txt","w")
$stderr = fname
$stdout = fname
puts 2 + 2 
fname.close
