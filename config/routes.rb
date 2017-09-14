Rails.application.routes.draw do
	root 'urls#index'
    resources :urls
    get '/urls/:id/short' => 'urls#short'
end
