class CreateItems < ActiveRecord::Migration[7.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.decimal :price, null: false
      t.integer :frequency, null: false

      t.timestamps
    end
  end
end
