class AddColumnToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
  end
end
