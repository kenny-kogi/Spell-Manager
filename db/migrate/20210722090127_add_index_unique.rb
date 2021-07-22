class AddIndexUnique < ActiveRecord::Migration[6.1]
  def change
    remove_index :spell_books, :spells_id
    remove_index :spell_books, :books_id
    add_index :spell_books, :spells_id, unique: true
    add_index :spell_books, :books_id, unique: true
  end
end
