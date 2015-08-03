class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :name, null: false
      t.references :user
      t.timestamps
    end
  end
end
