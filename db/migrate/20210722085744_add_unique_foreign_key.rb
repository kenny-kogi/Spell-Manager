class AddUniqueForeignKey < ActiveRecord::Migration[6.1]
  def change
    add_reference :spell_books, :spells, foreign_key: true, :unique => true
    add_reference :spell_books, :books, foreign_key: true, :unique => true
  end
end
