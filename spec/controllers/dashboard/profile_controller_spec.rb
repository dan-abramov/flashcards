require 'rails_helper'

describe Dashboard::ProfileController do #red specs!
  describe 'PATCH #update' do
    context 'user updated' do
      before do
        @user = create(:user)
        sign_in(@user)
      end

      it 'updates user' do
        patch :update, { id: @user, email: 'new@email.com', password: @user.password,
                         password_confirmation: @user.password_confirmation, local: 'en' }
        expect(user.email).to eq 'new@email.com'
        expect(user.local).to eq 'en'
      end

      it 'redirects to root_path' do
        patch :update, { id: @user, email: 'new@email.com', password: @user.password,
                         password_confirmation: @user.password_confirmation, local: 'en' }
        expect(response).to redirect_to edit_profile_path
      end
    end

    context 'user did not update' do
      it 'render user template' do
        user = create(:user)
        sign_in(user)
        patch :update, { id: user, email: 'new@email.com', password: '12345',
                         password_confirmation: '12345', local: 'en' } }
        expect(response).to render_template ('...')
      end
    end
  end
end
