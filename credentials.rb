# INTRODUCTION

# This script echos the active Heroku credentials (useful when switching between multiple Heroku accounts
# remembering which one is active).

# USAGE

# ruby credentials.rb

# CONFIGURATION

HEROKU_HOME = ENV['HOME'] + "/.heroku"
CREDENTIALS_FILE = "credentials"

# EXECUTION

credentials_path = File.join HEROKU_HOME, CREDENTIALS_FILE
if File.exists? credentials_path
  puts "\nYour active Heroku credentials are:\n\n"
  system "cat #{credentials_path}"
  puts "\nSource: #{credentials_path}\n\n"
else
  puts "ERROR: Heroku credentials not found!"
end
