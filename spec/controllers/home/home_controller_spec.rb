require 'rails_helper'

describe Home::HomeController do
  describe 'GET #index' do
    it 'shows card without block' do
      current_user = create(:user_with_one_block_and_two_cards)
      sign_in(current_user)
      get :index, id: current_user.cards[0]
      expect(assigns(:card)).to eq current_user.cards[0]
    end

    it 'shows card with block' do #red spec! undefined method `cards' for nil:NilClass
      current_user = create(:user_with_current_block_and_two_cards)
      sign_in(current_user)
      get :index
      expect(assigns(:card)).to eq current_user.current_block.cards[0]
    end
  end
end
