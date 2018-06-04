require 'rails_helper'

describe Dashboard::UsersController do
  describe 'DELETE #destroy' do
    before { @user = create(:user) }

    it 'destroys user' do #red spec! expected #count to have changed by 1, but was changed by 0
      expect{ delete :destroy, { id: @user.id } }.to change(User, :count).by(-1)
    end

    it 'redirects to root_path' do
      delete :destroy, { id: @user.id }
      expect(response).to redirect_to login_path
    end
  end
end
