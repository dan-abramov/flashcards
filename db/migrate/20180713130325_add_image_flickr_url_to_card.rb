class AddImageFlickrUrlToCard < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :image_flickr_url, :string
  end
end
