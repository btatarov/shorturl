class MainController < ApplicationController
	
	def index
	end
	
	def redirect
		url = Url.find(Url.getIdByUrl(params[:id])) rescue nil
		if url.nil? then redirect_to :action => :index
		else redirect_to url.url end
	end
	
	def generate
		if !(params[:url].to_s == '')
			url = Url.new
			url.url = params[:url]
			url.save
			flash[:real] = params[:url]
			flash[:url] = 'http://' + request.env["HTTP_HOST"] + '/' + url.getUrlById.to_s
		end
		redirect_to :action => :index
	end

end
