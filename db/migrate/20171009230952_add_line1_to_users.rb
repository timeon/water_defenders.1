class AddLine1ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :line_1, :string
  end
end
