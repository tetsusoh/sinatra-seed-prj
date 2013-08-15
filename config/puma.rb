case @options[:environment]
when /production/
	puts "config puma for production"
	stdout_redirect 'log/app.log', 'log/app.log', true

	daemonize true

	bind 'unix://run/puma.sock'

	# min and max number of threads to use to answer
	threads 0, 16

	# start 2 process
	workers 2
	preload_app!
when /development/
	puts "config puma for development"

	daemonize false

	threads 0, 1

	bind 'tcp://0.0.0.0:8080'
when /testing/
	puts "config puma for testing"
	threads 0, 16

	daemonize false

	bind 'tcp://0.0.0.0:8080'
end

# Load “path” as a rackup file.
rackup 'config.ru'

pidfile 'run/puma.pid'
state_path 'run/puma.state'

# disable logging from puma. app will take log
quiet




