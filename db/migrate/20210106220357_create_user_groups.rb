class CreateUserGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :user_groups do |t|
      t.string :name
      t.references :creator_id, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
