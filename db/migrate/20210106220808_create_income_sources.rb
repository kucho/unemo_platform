class CreateIncomeSources < ActiveRecord::Migration[6.1]
  def change
    create_table :income_sources do |t|
      t.string :name
      t.references :income_type, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :currency, null: false, foreign_key: true

      t.timestamps
    end
  end
end
