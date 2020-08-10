class RenameTweetColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :tweet, :tweet_id
  end
end
