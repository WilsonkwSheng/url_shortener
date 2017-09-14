class UrlsController < ApplicationController
	def index
		@urls = Url.all
		@url = Url.new
	end

	def show
		# byebug <ActionController::Parameters {"controller"=>"urls", "action"=>"show", "id"=>"1"} permitted: false>
		@url = Url.find(params[:id])
	end

	def new
		@url = Url.new
	end

	def create
		#byebug
		@url = Url.new(url_params)
		@url.shorten
		if @url.save
			redirect_to @url
		else
			render 'new'
		end
	end

	private
	def url_params
		params.require(:url).permit(:long_url)
	end
end
