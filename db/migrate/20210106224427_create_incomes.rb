class CreateIncomes < ActiveRecord::Migration[6.1]
  def change
    create_table :incomes do |t|
      t.decimal :amount, precision: 8, scale: 2, null: false
      t.string :description
      t.references :income_source, null: false, foreign_key: true

      t.timestamps
    end
  end
end
