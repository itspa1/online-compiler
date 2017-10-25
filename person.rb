fname = File.open("person.txt","w")
$stderr = fname
$stdout = fname
class Person
	attr_reader :name
	def initialize(name)
		@name = name
	end
end

p = Person.new('Aniket Rao')
puts p.name
fname.close
