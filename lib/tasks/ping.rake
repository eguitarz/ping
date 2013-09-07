desc 'Ping the hosts every specific time'
task :ping do
	past = Time.now
	duration = 10
	while true do
		now = Time.now
		sleep 1
		if (now - past > duration)
			past = now
			# do something
		end
	end
end