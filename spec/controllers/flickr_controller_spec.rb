require 'rails_helper'

RSpec.describe FlickrController, type: :controller do
  before do
    get :find, params: { flickr: 'hello', format: :js }
  end
  describe 'GET #find' do
    it 'has right api_key and api_secret', :vcr do
      expect(assigns(:flickr).api_key)   .to eq 'd7e7d59b9148452e69f460ea7be6c4c6'
      expect(assigns(:flickr).api_secret).to eq '46a323880cc9f589'
    end
    
    it 'has 10 photos', :vcr do
      expect(assigns(:photos).length).to eq 10
    end
  end
end
