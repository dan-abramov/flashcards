require 'rails_helper'

describe Dashboard::UsersController do
  describe 'DELETE #destroy' do
    let(:user) { create(:user) }

    it 'destroys user' do
      expect{ delete :destroy, params: { id: user.id } }.to change(User, :count).by(1)
    end

    it 'redirects to root_path' do
      delete :destroy, params: { id: user.id }
      expect(response).to redirect_to login_path
    end
  end
end
