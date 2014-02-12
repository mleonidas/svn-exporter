Gem::Specification.new do |s|
  s.name 	= 'svnexport'
  s.version 	= '0.0.2'
  s.date	= '2014-02-11'
  s.summary 	= 'Export Svn Repos'
  s.description = 'A ruby library to keep svn exported directories in sync. Specify the repo url retention and directory to export. Then from the cli state the tier rev number and Jira ticket number.'
  s.authors 	= 'Mike Leone'
  s.email 	= 'mleone896@gmail.com'
  files	= []
  dirs 	= %w{lib}
  dirs.each do |dir|
    files += Dir["#{dir}/**/*"]
  end

  s.files = files
  s.homepage 	= 'http://rubygems.org/gems/svnexport'
  s.license 	= 'MIT'
  s.executables = 'se'
end
