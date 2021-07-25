class CreateSpellBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :spell_books do |t|
      t.references :book, foreign_key: true
      t.references :spell, foreign_key: true

      t.timestamps
    end

    add_index :spell_books, [:spell_id, :book_id], unique: true
  end
end
