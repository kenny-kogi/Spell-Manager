class Spell < ApplicationRecord
  has_many :spell_books, dependent: :destroy
  has_many :books, through: :spells

  SCHOOL_OPTIONS = ['Conjuration', 'Necromancy', 'Evocation', 'Abjuration', 'Transmutation', 'Divination', 'Enchantment', 'Illusion']
  CLASS_OPTIONS = ['Bard', 'Cleric', 'Druid', 'Paladin', 'Ranger', 'Sorcerer', 'Warlock', 'Wizard']
  validates :name, presence: true, uniqueness: { case_sensitive: false, message: "Name cannot be the same as an existing spell. Case insensitive"}
  validates :school, presence: true, inclusion: { in: SCHOOL_OPTIONS }
  validates_presence_of :classes, message: 'A spell must have one or more classes'
  validates_inclusion_of :classes, in: CLASS_OPTIONS
  validates :concentration, inclusion: [true, false]
  validates_length_of :description, maximum: 4096
  validates :level, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 9, message: 'must be between 0 & 9'}

  # validates_numericality_of :level, greater_than_or_equal_to: 0, less_than_or_equal_to: 9, message: 'must be between 0 & 9'
end

