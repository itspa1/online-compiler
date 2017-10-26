class InputFile
  attr_accessor :name,:content,:extension

  @@lang = {
    "ruby" => "rb",
    "javascript" => "js",
    "python" => "py"
  }
  def initialize(name,content,language)
    self.name = name
    self.content = content
    self.extension = @@lang[language]
  end

  def createFile
    somefile = File.open("#{self.name}.#{self.extension}","w")
    case self.extension
    when "js"
      somefile.puts "var fs = require('fs');"
      somefile.puts "var access = fs.createWriteStream('#{self.name}.txt');"
      somefile.puts "access.truncate;"
      somefile.puts "process.stdout.write = process.stderr.write = access.write.bind(access);"
      somefile.puts "process.on('uncaughtException', function(err) {
      console.error((err && err.stack) ? err.stack : err);
      });"
      somefile.puts self.content
    when "py"
    somefile.puts "import sys"
    somefile.puts "sys.stdout = sys.stderr = open(\"#{self.name}.txt\",\"w\")"
    somefile.puts self.content
    else
    somefile.puts "fname = File.open(\"#{self.name}.txt\",\"w\")"
    somefile.puts "$stderr = fname"
    somefile.puts "$stdout = fname"
    somefile.puts self.content
    somefile.puts "fname.close"
    end
    somefile.close
  end

  def execute
    case self.extension
    when "js"
      cmd = "node #{self.name}.js"
      `#{cmd}`
    when "py"
    cmd = "python3 #{self.name}.py"
    `#{cmd}`
    else
    cmd = "ruby #{self.name}.rb"
    `#{cmd}`
    end
  end

  def respond
    val = File.read("#{self.name}.txt")
    return val
  end
end
