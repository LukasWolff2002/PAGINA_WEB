class AddTableBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.bigint :work_team_id, null: true  
      t.bigint :design_id, null: true  
      
      t.timestamps
    end
  end
end
