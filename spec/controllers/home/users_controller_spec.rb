require 'rails_helper'

describe Home::UsersController do
  describe 'GET #new' do
    it 'assigns new User to @user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it 'redirects to root_path if user created' do
      current_user = create(:user)
      sign_in(current_user)
      get :new
      expect(response).to redirect_to root_path
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates new user' do
        expect { post :create, params: { user: attributes_for(:user) } }.to change(User, :count).by(1)
      end

      it 'redirects to root_path' do
        post :create, params: { user: attributes_for(:user) }
        expect(response).to redirect_to root_path
      end
    end

    context 'with invalid attributes' do
      it 'creates new user' do
        expect { post :create, params: { user: attributes_for(:invalid_user) } }.to change(User, :count).by(0)
      end

      it 'redirects to user' do
        post :create, params: { user: attributes_for(:invalid_user) }
        expect(response).to render_template('new')
      end
    end
  end
end
