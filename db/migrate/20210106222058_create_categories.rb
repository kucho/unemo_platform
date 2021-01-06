class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :label
      t.integer :order
      t.decimal :budget, precision: 8, scale: 2
      t.references :board, null: false, foreign_key: true
      t.references :parent, null: false, foreign_key: { to_table: :categories }
      t.timestamps
    end
  end
end
