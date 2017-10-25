fname = File.open("vinyas.txt","w")
$stderr = fname
$stdout = fname
puts 1 + 2
fname.close
