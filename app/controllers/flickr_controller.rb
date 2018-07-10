class FlickrController < ApplicationController
  def find
    @flickr = Flickr.new('config/flickr.yml')
    @photos = @flickr.photos.get_recent(:tag => params[:flickr].first).take(10)
    respond_to do |format|
      format.js
    end
  end
end
