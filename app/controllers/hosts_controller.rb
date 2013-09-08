require 'net/http'

class HostsController < ApplicationController

	def index
		@hosts = Host.all
	end

	def show
		@host = Host.find(params[:id])
	end

	def ping
		@host = Host.find(params[:host_id])
		response = ping_host(@host)
		render :json => response
	end

	private 
	def ping_host(host)
		start_at = Time.now
		response = Net::HTTP.get_response( URI(host.url) )
		duration = ( Time.now - start_at ) * 1000

		ping = host.ping_records.create( :response_ms => duration.floor, :response_code => response.code)
		ping.save!

		{'response_ms'=>duration.floor, 'response_code'=>response.code}
	end
end
