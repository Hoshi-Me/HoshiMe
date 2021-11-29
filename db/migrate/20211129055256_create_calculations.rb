class CreateCalculations < ActiveRecord::Migration[6.1]
  def change
    create_table :calculations do |t|
      t.references :item, null: false, foreign_key: true
      t.float :degree_value, null: false
      t.float :start_value, null: false
      t.float :finish_value, null: false
      t.float :price_value, null: false
      t.float :sum, null: false

      t.timestamps
    end
  end
end
