require 'fileutils'
module Svnexport
  class Actions
    def initialize(metadata, rev, tier, jira)
      @path = metadata[tier]['mounted_dir']
      @rev = rev
      @retain =  metadata[tier]['retain'].to_i
      @url = metadata[tier]['repo']
      @jira = jira
      @svn = Svnexport::Svn.new(@rev, @path, @url, File.basename(@url))
    end

    def archive_old_dirs
      if File.directory?("#{@path}/trash")
	trash = "#{@path}/trash"
      else
	abort("The trash directory does not exist, we can not rotate")
      end
      # get a list of the directories listed by time
      files_sorted_by_time = Dir["#{@path}/*"].sort_by{ |f| File.ctime(f) }

      # delete the trash directory from array
      files_sorted_by_time.delete("#{@path}/trash")

      sum_arr = files_sorted_by_time.count
      difference = sum_arr - @retain
      if difference > 0
	old_dirs = files_sorted_by_time.first(difference)
	old_dirs.each do |x|
	  FileUtils.mv("#{x}", "#{@path}/trash")
	end
      end
    end
    def check_rev
      @svn.check_rev
    end

    def checkout
      @svn.checkout
    end

    def rotate
      repo_name = File.basename("#{@url}")
      if File.directory?("#{@path}/#{repo_name}")
        FileUtils.mv("#{@path}/#{repo_name}", "#{@path}/#{repo_name}-old-SYS-#{@jira}")
      end
    end
  end
end
