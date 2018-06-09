require 'rails_helper'

describe Home::UserSessionsController do
  describe 'POST #create' do
    let(:user) { create(:user) }
    
    context 'with valid attributes' do
      it 'creates new session' do
        sign_in(user)
        expect(logged_in?).to eq true
      end
    end
  end

  describe 'GET #new' do
    context 'when current user exists' do
      it 'redirects to root_path' do
        user = create(:user)
        sign_in(user)
        get :new
        expect(response).to redirect_to root_path
      end
    end

    context 'current user does not exist' do
      it 'creates new' do
        get :new
        expect(assigns(:user)).to be_a_new(User)
      end
    end
  end
end
