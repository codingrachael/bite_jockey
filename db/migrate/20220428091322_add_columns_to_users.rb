class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :spotify_id, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :user_name, :string
    add_column :users, :operator_type, :string
    add_column :users, :location, :string
    add_column :users, :image, :string
    add_column :users, :social_link, :string
  end
end
