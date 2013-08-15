case ENV['RACK_ENV']
when /production/i
	listen "run/unicorn.sock"
	pid 'run/unicorn.pid'
	# logger for unicorn's log (start/stop log, error and so on)
	logger ::Logger.new('log/app.log')
when /testing/i
	listen "0.0.0.0:8080"
	pid 'run/unicorn.pid'
	# logger for unicorn's log (start/stop log, error and so on)
	logger ::Logger.new(STDOUT)
when /development/i
	listen "0.0.0.0:8080"
	pid 'run/unicorn.pid'
	# logger for unicorn's log (start/stop log, error and so on)
	logger ::Logger.new(STDOUT)
end

# stderr_path & stdout_path, will effact globally

# access log will be handled by app for log rotation
# so disable unicorn's access log
# unicorn's access logging goes to stderr
stderr_path '/dev/null'

