class FlickrController < ApplicationController
  def search
    render layout: 'flickr_search'
  end

  def find
    @flickr = Flickr.new('config/flickr.yml') unless @flickr
    @photos = @flickr.photos.get_recent(:tag => params[:flickr].first).take(10)
  end
end
