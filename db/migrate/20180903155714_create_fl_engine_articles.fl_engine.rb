# This migration comes from fl_engine (originally 20180829111706)
class CreateFlEngineArticles < ActiveRecord::Migration[5.1]
  def change
    create_table   :fl_engine_articles do |t|
      t.string     :title
      t.text       :text
      t.references :postable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
