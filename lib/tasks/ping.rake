require 'net/http'
desc 'Ping the hosts every specific time'
task :ping, :duration do |t, args|
	past = Time.at(0)
	duration = args[:duration] || 60
	duration = duration.to_i

	while true do
		now = Time.now
		sleep 1
		if (now - past > duration)
			past = now
			# ping
			response = Net::HTTP.get( URI('http://localhost:3000/ping_all') )
			puts "pinging..."
			puts response
		end
	end
end

task :invoke_ping do
  Rake.application.invoke_task("ping[1]")
end
