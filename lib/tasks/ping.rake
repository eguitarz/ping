require 'net/http'
desc 'Ping the hosts every specific time'
task :ping do
	past = Time.at(0)
	duration = 30

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