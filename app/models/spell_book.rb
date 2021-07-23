class SpellBook < ApplicationRecord
    belongs_to :spells
    belongs_to :books
end
