class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :uid, null: false
      t.string :name
      t.string :email
      t.string :provider, null: false
      t.string :image_url
      t.string :location
      t.string :url
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.timestamps
    end
      add_index :users, :provider
      add_index :users, :uid
      add_index :users, [:provider, :uid], unique: true
  end
end
