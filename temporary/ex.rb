fname = File.open("temporary/ex.txt","w")
$stderr = fname
$stdout = fname
puts "hi"
fname.close
