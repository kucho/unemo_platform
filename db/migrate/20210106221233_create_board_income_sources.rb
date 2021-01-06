class CreateBoardIncomeSources < ActiveRecord::Migration[6.1]
  def change
    create_table :board_income_sources do |t|
      t.decimal :amount, precision: 8, scale: 2, null: false
      t.references :income_source, null: false, foreign_key: true
      t.references :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
