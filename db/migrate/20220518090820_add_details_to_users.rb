class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :pronoun, :string
    add_column :users, :description, :text
    add_column :users, :genres, :string
  end
end
