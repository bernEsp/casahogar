CasaHogar::Application.routes do
  resources :sitemaps, only: :index
	root to: 'Home#index'
end
