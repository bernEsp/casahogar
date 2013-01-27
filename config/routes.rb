CasaHogar::Application.routes do
	match '/vision'    =>   'Home#vission'
	match '/mision'    =>   'Home#mission'
	match '/quienes'   =>   'Home#who'
	match '/servicios' =>   'Home#services'
	match '/historia'  =>   'Home#history'
	root to: 'Home#index'
end
