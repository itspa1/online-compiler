fname = File.open("vishnu.txt","w")
$stderr = fname
$stdout = fname
class Vishnu
 attr_accessor :first_name, :last_name
 
 def initialize(details)
   @first_name = details[:first_name]
   @last_name = details[:last_name]
 end 
end

p1 = Vishnu.new({first_name: "Vishnu"})
puts p1.first_name1
fname.close
