class Spell < ApplicationRecord
    validates :name, presence: true
    validates_uniqueness_of :name, :case_sensitive => false
    validates :school, presence: true
    validates :classes, presence: true
    validates_length_of :description, :maximum => 4096
    has_many :spell_books

    enum school: [:Conjuration, :Necromancy, :Evocation, :Abjuration, :Transmutation, :Divination, :Enchantment, :Illusion]

end
