class Book < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false, message: "Name cannot be the same as an existing book. Case insensitive"}

  has_many :spell_books, dependent: :destroy
  has_many :spells, through: :spell_books

  def self.order_by field
    if field == 'name'
      return Book.order(:name)
    elsif field == 'spell_count'
      count_arr = []
      books = Book.all
      books.each do |book|
        count_arr.append(book.spells.count)
      end
      return Book.order(:count_arr)
    else
      return Book.order(:name)
    end
  end


end

