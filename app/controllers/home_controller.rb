class HomeController < ApplicationController


	def index
  	@albums = SpudPhotoAlbum.order('created_at desc')
		@photos = @albums.first.photos
 	end


end
