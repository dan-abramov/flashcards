require 'rails_helper'

describe Dashboard::ProfileController do
  let(:user) { create(:user, password: '123456', password_confirmation: '123456' ) }

  describe 'PATCH #update' do
    context 'user updated' do
      before { sign_in(user) }

      it 'modifies object' do
        patch :update, params: { id: user, user: { email: 'new@email.com', password: '123456',
                         password_confirmation: '123456', locale: 'en' } }
        user.reload
        expect(user.email).to eq 'new@email.com'
        expect(user.locale).to eq 'en'
      end

      it 'redirects to edit_profile_path' do
        patch :update, params: { id: user, user: { email: 'new@email.com', password: '123456',
                         password_confirmation: '123456', locale: 'en' } }
        expect(response).to redirect_to edit_profile_path
      end
    end

    context 'user did not update' do
      it 'render user template' do
        sign_in(user)
        patch :update, params: { id: user, user: { email: 'new@email.com', password: user.password,
                         password_confirmation: user.password_confirmation, locale: 'en' } }
        expect(response).to render_template ('edit')
      end
    end
  end
end
