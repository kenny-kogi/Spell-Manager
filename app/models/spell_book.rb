class SpellBook < ApplicationRecord
  belongs_to :spell
  belongs_to :book

  validates :spell, uniqueness: { scope: :book, message: "is already added to the book" }

  def spell_count(id)
    book = SpellBook.where({book_id: id})
    book
  end
end
