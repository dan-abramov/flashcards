require 'rails_helper'

describe Dashboard::ProfileController do #red specs!
  describe 'PATCH #update' do
    context 'user updated' do
      before do
        @user = create(:user)
        sign_in(@user)
      end

      it 'modifies object' do  #did not change e-mail and locale
        patch :update, { id: @user, user: { email: 'new@email.com', password: @user.password,
                         password_confirmation: @user.password_confirmation, local: 'en' } }
        @user.reload
        expect(@user.email).to eq 'new@email.com'
        expect(@user.local).to eq 'en'
      end

      it 'redirects to edit_profile_path' do #Expected response to be a <redirect>, but was <200>
        patch :update, { id: @user, user: { email: 'new@email.com', password: @user.password,
                         password_confirmation: @user.password_confirmation, local: 'en' } }
        expect(response).to redirect_to edit_profile_path
      end
    end

    context 'user did not update' do
      it 'render user template' do
        user = create(:user)
        sign_in(user)
        patch :update, { id: user, user: { email: 'new@email.com', password: user.password,
                         password_confirmation: user.password_confirmation, local: 'en' } }
        expect(response).to render_template ('edit')
      end
    end
  end
end
