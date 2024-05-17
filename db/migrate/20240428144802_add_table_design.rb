class AddTableDesign < ActiveRecord::Migration[7.1]
  def change
    create_table :designs do |t|
      t.string :name, null: false
      t.text :description
      t.string :type_of_attribute, null: false

      t.timestamps
    end
  end
end
