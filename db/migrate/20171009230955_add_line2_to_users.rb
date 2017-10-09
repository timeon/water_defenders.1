class AddLine2ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :line_2, :string
  end
end
