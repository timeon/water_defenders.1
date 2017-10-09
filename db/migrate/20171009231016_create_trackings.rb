class CreateTrackings < ActiveRecord::Migration
  def change
    create_table :trackings do |t|
      t.string :area
      t.string :usage
      t.integer :value
      t.string :unit
      t.references :user, index: true

      t.timestamps
    end
  end
end
