fname = File.open("example.txt","w")
$stderr = fname
$stdout = fname
class Op
attr_accessor :name,:id
def initialize(name,id)
self.name = name 
self.id = id
end
end
out = Op.new("pk",10)
puts out.name
fname.close
