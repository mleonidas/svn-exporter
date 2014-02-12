module Svnexport
  class Config
    def initialize
    end

    def loadconfig(configfile="./export.conf")
      if File.exists?(configfile)
	currentsection = "global"
	hash = {}
	File.open(configfile, "r").each do |line|
	  # strip blank spaces, tabs etc off the end of all lines
	  # stolen right from mcollective rubys
	  line.gsub!(/\s*$/, "")
	  unless line =~ /^#|^$/
	    if (line =~ /\[(.*)\]/)
	      currentsection = $1
	      hash[currentsection] = {}
	    elsif (line =~ /(.+?)\s*=\s*(.+)/)
	      key = $1
	      val = $2
	      if val.match(/.*,.*/)
		val = val.split(',')
	      end

	      hash[currentsection][key] = val
	    end
	  end
	end
      end
      hash
    end
  end
end
