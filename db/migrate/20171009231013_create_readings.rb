class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.datetime :read_at
      t.integer :value
      t.string :unit
      t.references :user, index: true

      t.timestamps
    end
  end
end
