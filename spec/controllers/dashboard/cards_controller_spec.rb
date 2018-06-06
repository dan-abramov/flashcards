require 'rails_helper'

describe Dashboard::CardsController do
  let(:user)  { create(:user) }
  let(:block) { create(:block, user: user) }
  let(:card)  { create(:card, block: block, user: user) }

  describe 'GET #index' do
    let(:user)  { create(:user_with_two_blocks_and_two_cards_in_each) }

    it 'make array of all cards' do
      sign_in(user)
      get :index
      expect(assigns(:cards)).to eq user.cards
    end
  end

  describe 'GET #new' do
    it 'creates new card' do
      sign_in(user)
      get :new
      expect(assigns(:card)).to be_a_new(Card)
    end
  end

  describe 'POST #create' do
    let(:block) { create(:block, user: user) }

    context 'with valid attributes' do
      before { sign_in(user) }

      it 'creates new card' do #red spec! expected #count to have changed by 1, but was changed by 0
        expect { post :create, card: { original_text: 'дом',
                                       translated_text: 'house',
                                       image: 'string', interval: 1,
                                       repeat: 1, efactor: 2.5, quality: 5,
                                       attempt: 1, user: user, block: block } }.to change(user.cards, :count).by(1)
      end

      it 'redirects to cards path' do
        post :create, card: { original_text: 'дом',
                              translated_text: 'house',
                              image: 'string', interval: 1,
                              repeat: 1, efactor: 2.5, quality: 5,
                              attempt: 1, user: user, block: block }
        expect(response).to redirect_to cards_path
      end
    end

    context 'with invalid attributes' do
      it 'render template create' do
        sign_in(user)
        post :create, card: attributes_for(:invalid_card)
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PATCH #update' do
    context 'if card updated' do
      before { sign_in(user) }

      it 'modifies info' do
        patch :update, { id: card, card: { original_text: 'домище', translated_text: 'a big house' } }
        card.reload
        expect(card.original_text).to eq 'домище'
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys card' do
      expect { delete :destroy, { id: card.id } }.to change(Card, :count).by(1)
    end

    it 'redirects to root_path' do
      delete :destroy, { id: card.id }
      expect(response).to redirect_to login_path
    end
  end
end
