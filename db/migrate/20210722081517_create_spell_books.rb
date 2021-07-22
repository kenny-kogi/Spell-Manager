class CreateSpellBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :spell_books do |t|

      t.timestamps
    end
  end
end
