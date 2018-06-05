require 'rails_helper'

describe Dashboard::CardsController do

  describe 'GET #index' do
    it 'make array of all cards' do
      user = create(:user_with_two_blocks_and_two_cards_in_each)
      sign_in(user)
      get :index
      expect(assigns(:cards)).to eq user.cards
    end
  end

  describe 'GET #new' do
    it 'creates new card' do
      user = create(:user)
      sign_in(user)
      get :new
      expect(assigns(:card)).to be_a_new(Card)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      before do
        @user = create(:user)
        sign_in(@user)
      end

      it 'creates new card' do #red spec! expected #count to have changed by 1, but was changed by 0
        expect{ post :create, card: attributes_for(:card) }.to change(@user.cards, :count).by(1)
      end

      it 'redirects to cards path' do
        post :create, card: attributes_for(:card)
        expect(response).to redirect_to cards_path
      end
    end

    context 'with invalid attributes' do
      it 'render template create' do
        user = create(:user)
        sign_in(user)
        post :create, card: attributes_for(:invalid_card)
        expect(response).to render_template('new')
      end
    end
  end

  # describe 'PATCH #update' do
  #   context 'if card updated' do
  #     before do
  #       @user = create(:user)
  #       sign_in(@user)
  #       @card = create(:card, user: @user)
  #     end
  #
  #     it 'modifies info' do
  #       patch :update, { id: @card, card: { original_text: 'домище', translated_text: 'a big house' } }
  #       expect(@card.original_text).to eq 'домище'
  #     end
  #   end
  #
  # end


  describe 'DELETE #destroy' do
    before { @card = create(:card) }

    it 'destroys card' do
      expect{ delete :destroy, { id: @card.id } }.to change(Card, :count).by(-1)
    end

    it 'redirects to root_path' do
      delete :destroy, { id: @car.id }
      expect(response).to redirect_to login_path
    end
  end
end
