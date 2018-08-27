require 'rails_helper'
require 'yaml'

RSpec.describe FlickrController, type: :controller do
  before do
    get :find, params: { flickr: 'hello', format: :js }
    @flickr_access = YAML.load(File.read("config/flickr.yml"))
  end
  describe 'GET #find' do
    it 'has right api_key and api_secret', :vcr do
      expect(assigns(:flickr).api_key)   .to eq @flickr_access['key']
      expect(assigns(:flickr).api_secret).to eq @flickr_access['secret']
    end

    it 'has 10 photos', :vcr do
      expect(assigns(:photos).length).to eq 10
    end
  end
end
