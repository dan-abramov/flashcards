class Dashboard::CardsController < Dashboard::BaseController
  respond_to :html
  before_action :set_card, only: [:destroy, :edit, :update]

  def index
    @cards = current_user.cards.all.order('review_date')
  end

  def new
    @card = Card.new
  end

  def edit
  end

  def create
    @card = current_user.cards.build(card_params)
    if @card.save
      redirect_to cards_path
    else
      respond_with @card
    end
  end

  def update
    respond_to do |format|
      format.html do
        if @card.update(card_params)
          redirect_to cards_path
        else
          respond_with @card
        end
      end
      format.js do
        @card.update(card_params)
        @card.update(image_flickr_url:nil) unless card_params['image_flickr_url']
        @card.remove_image! unless card_params['image_']
        binding.pry
      end
    end
  end

  def destroy
    @card.destroy
    respond_with @card
  end

  private

  def set_card
    @card = current_user.cards.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date,
                                 :image, :image_cache, :remove_image, :block_id, :image_flickr_url)
  end
end
