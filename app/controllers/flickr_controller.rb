class FlickrController < ApplicationController
  protect_from_forgery except: :find

  def find
    @flickr = Flickr.new('config/flickr.yml')
    @photos = @flickr.photos.get_recent(:tag => params[:flickr].first).take(10)
  end
end
