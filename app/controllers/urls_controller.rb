class UrlsController < ApplicationController
	def index
		@urls = Url.all
	end

	def show
		# byebug <ActionController::Parameters {"controller"=>"urls", "action"=>"show", "id"=>"1"} permitted: false>
		@url = Url.find(params[:id])
	end
end
