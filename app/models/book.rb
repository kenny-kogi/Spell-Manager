class Book < ApplicationRecord
    validates :name, presence: true
    validates_uniqueness_of :name, :case_sensitive => false
    has_many :spell_books
end
