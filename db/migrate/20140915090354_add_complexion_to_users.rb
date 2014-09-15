class AddComplexionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :complexion, :string
  end
end
