class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.string :description
      t.decimal :amount, precision: 8, scale: 2, null:false
      t.references :payee, null: false, foreign_key: true
      t.references :board, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :currency, null: false, foreign_key: true
      t.datetime :date, null: false
      t.boolean :pending, default: true
      t.decimal :exchange_rate, precision: 8, scale: 2, default: 1.0, null: false

      t.timestamps
    end
  end
end
