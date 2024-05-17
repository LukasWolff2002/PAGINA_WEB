class AddTableTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :status, null: false
      t.integer :priority, null: false

      t.references :board, foreign_key: true, null: false

      t.references :creator, foreign_key: { to_table: :users }, null: false
      t.references :assignee, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
  end
end
