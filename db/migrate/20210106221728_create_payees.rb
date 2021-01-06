class CreatePayees < ActiveRecord::Migration[6.1]
  def change
    create_table :payees do |t|
      t.string :name
      t.string :note
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
