require 'net/http'

class HostsController < ApplicationController
	before_filter :all, :only => [:index, :ping_all]
	before_filter :find_one, :only => [:show, :destroy]

	def index
	end

	def new
		@host = Host.new
	end

	def create
		@host = Host.new params.require(:host).permit(:name, :url)
		@host.save

		redirect_to :action => :index
	end

	def show
		@pings = @host.ping_records.map do |p|
			{value: p.response_ms, aa: p.created_at, created_at: p.created_at}
		end
		@pings_json = @pings.take(30).to_json
	end

	def destroy
		@host.destroy

		render :json => {:status => 'ok'}
	end

	def ping
		@host = Host.find(params[:host_id])
		response = ping_host(@host)
		render :json => response
	end

	def ping_all
		@hosts.each do |h|
			ping_host(h)
		end
		render :json => {:hosts => @hosts.count}
	end

	private 
	def all
		@hosts = Host.all
	end

	def find_one
		@host = Host.find(params[:id])
	end

	def ping_host(host)
		start_at = Time.now
		response = Net::HTTP.get_response( URI(host.url) )
		duration = ( Time.now - start_at ) * 1000

		ping = host.ping_records.create( :response_ms => duration.floor, :response_code => response.code)
		ping.save!

		{'response_ms'=>duration.floor, 'response_code'=>response.code}
	end

end
