svn-exporter
============

Ruby Lib to manage svn exports in different directories from a config file.


Config:

The config object reads from a file in this format
ex:

[uat]
mounted_dir=/path/to/dir

repo=https://pathtorepo

retain=3 # the amount of directories you want to retain


You can have as many sections as you want [uat] [prod] etc... 
The variables have to be named as above though. 



Binary 'se'
when you call the binary you pass it what tier (section) you want to run the Jira ticket number, which is appended in the rotated directory name and the revision of the repo you want to checkout.




