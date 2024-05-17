class AddTableWorkUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :work_users do |t|
      t.references :user, foreign_key: true, null: false
      t.references :work_team, foreign_key: true, null: false

      t.timestamps
    end
  end
end
