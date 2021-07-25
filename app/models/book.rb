class Book < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false, message: "Name cannot be the same as an existing book. Case insensitive"}

  has_many :spell_books
  has_many :spells, through: :spell_books
end
