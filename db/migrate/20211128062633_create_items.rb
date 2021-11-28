class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :degree, null: false
      t.integer :start_date, null: false
      t.integer :finish_date, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
