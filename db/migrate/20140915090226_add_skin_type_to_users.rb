class AddSkinTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :skin_type, :string
  end
end
