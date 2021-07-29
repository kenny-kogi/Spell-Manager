class Book < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false, message: "Name cannot be the same as an existing book. Case insensitive"}

  has_many :spell_books
  has_many :spells, through: :spell_books

  def self.order_by field
    if field == 'name'
      return Book.order(:name)
    elsif field == 'spell_count'
      book = Book.all
      return Book.order()
    else
      return Book.order(:name)
    end
  end

  def spell_count
    @book.spells.count
  end
end

