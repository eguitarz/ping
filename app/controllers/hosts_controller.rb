class HostsController < ApplicationController

	def index
		@hosts = Host.all
	end

	def show
		@host = Host.find(params[:id])
	end

	def ping
		@host = Host.find(params[:host_id])
		render :json => {'respond_ms'=>100}
	end
end
