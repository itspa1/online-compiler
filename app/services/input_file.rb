class InputFile
  attr_accessor :name,:content

  def initialize(name,content)
    self.name = name
    self.content = content
  end

  def createFile
    somefile = File.open("#{self.name}.rb","w")
    somefile.puts "fname = File.open(\"#{self.name}.txt\",\"w\")"
    somefile.puts "$stderr = fname"
    somefile.puts "$stdout = fname"
    somefile.puts self.content
    somefile.puts "fname.close"
    somefile.close
  end

  def execute
    cmd = "ruby #{self.name}.rb"
    `#{cmd}`
  end

  def respond
    val = File.read("#{self.name}.txt")
    return val
  end
end
