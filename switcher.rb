# INTRODUCTION

# This script makes switching between multiple Heroku accounts easier by replacing existing Heroku
# account crendentials (i.e. ~/.heroku/crendentials) with new account credentials. This script assumes
# that your various Heroku account credential files are named as <account>.credentials and located in
# the default Heroku folder (as mentioned earlier).

# USAGE

# Format: ruby switch.rb <account>
# Example: ruby switch.rb default

# CONFIGURATION

HEROKU_HOME = ENV['HOME'] + "/.heroku"
SSH_HOME = ENV['HOME'] + "/.ssh"
CREDENTIALS_FILE = "credentials"
IDENTITY_FILE = 'heroku.conf'
DEFAULT_ACCOUNT = "dblf"

# EXECUTION

account = ARGV.empty? ? DEFAULT_ACCOUNT : ARGV.first
account_path = File.join HEROKU_HOME, account + '.' + CREDENTIALS_FILE
credentials_path = File.join HEROKU_HOME, CREDENTIALS_FILE
identity_path = File.join SSH_HOME, account + "." + IDENTITY_FILE
identities_path = File.join SSH_HOME, "config"
puts "\nSwitching to the \"#{account}\" Heroku account..."
if File.exists? account_path
  system "cp -f #{account_path} #{credentials_path}"
else
  puts "ERROR: Heroku account credentials do not exist!"
end
if File.exists? identity_path
  system "cp -f #{identity_path} #{identities_path}"
else
  puts "ERROR: SSH identity does not exist!"
  puts "Expected: #{identity_path}"
end
puts "Heroku account switch complete.\n\n"
