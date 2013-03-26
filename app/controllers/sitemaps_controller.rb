class SitemapsController < ApplicationController


	def index
  	redirect_to 'http://casa-hogar.s3.amazonaws.com/sitemaps/sitemap_index.xml.gz', status: 302
  end


end

