class CreateSpells < ActiveRecord::Migration[6.1]
  def change
    create_table :spells do |t|
      t.string :name
      t.integer :level
      t.string :school
      t.string :classes
      t.boolean :concentration
      t.text :description

      t.timestamps
    end
  end
end
