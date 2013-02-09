class HomeController < ApplicationController


  def index
  	@photo_album = SpudPhotoAlbum.order('created_at desc').first
  end


end
