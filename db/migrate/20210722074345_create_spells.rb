class CreateSpells < ActiveRecord::Migration[6.1]
  def change
    create_table :spells do |t|
      t.string :name, limit: 70, null: false
      t.integer :level, null: false, default: 0
      t.string :school, limit: 30, null: false
      t.string :classes, default: [], null: false, array: true
      t.boolean :concentration, null: false, default: false
      t.text :description, limit: 4096

      t.timestamps
    end
  end
end
