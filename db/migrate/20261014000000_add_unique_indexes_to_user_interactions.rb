class AddUniqueIndexesToUserInteractions < ActiveRecord::Migration[7.0]
  def change
    add_index :flags, [:user_id, :flaggable_type, :flaggable_id], unique: true, name: 'index_flags_on_user_and_flaggable'
    add_index :likes, [:user_id, :likeable_type, :likeable_id], unique: true, name: 'index_likes_on_user_and_likeable'
    add_index :favorites, [:user_id, :favoritable_type, :favoritable_id], unique: true, name: 'index_favorites_on_user_and_favoritable'
  end
end
