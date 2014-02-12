module Svnexport
  class Svn
    def initialize(rev, path, url, repo)
      @rev = rev
      @path = path
      @url = url
      @repo = repo
    end
    def check_rev
      current_rev = `svn info #{@path}/#{@repo}| grep -i "last changed rev:" | awk -F: '{print $2}'`
      current_rev = current_rev.strip
      puts current_rev
      if current_rev == @rev
	return true
      else
	return false
      end
    end
    def checkout
      Dir.chdir(@path)
      `svn co -r #{@rev} #{@url} `
    end
  end
end
