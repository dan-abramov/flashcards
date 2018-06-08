require 'rails_helper'

describe Home::HomeController do
  describe 'GET #index' do
    let(:user) { create(:user, :with_block_with_card) }

    before { sign_in(user) }
    it 'shows card without current_block' do
      get :index, params: { id: user.cards[0] }
      expect(assigns(:card)).to eq user.cards[0]
    end

    it 'shows card with current block' do
      user.current_block = user.blocks[0]
      get :index
      expect(assigns(:card)).to eq user.current_block.cards[0]
    end
  end
end
