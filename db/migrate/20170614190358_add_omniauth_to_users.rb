class AddOmniauthToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :facebook_picture_url, :string
    # add_column :users, :first_name, :string
    # add_column :users, :last_name, :string
    add_column :users, :token, :string
    add_column :users, :token_expiry, :datetime

    # change_table :users do |t|
    #   t.change :first_name, :string
    #   t.change :last_name, :string
    # end

  end
end
