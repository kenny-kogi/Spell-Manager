class Spell < ApplicationRecord
    validates :name, presence :true, length: { maximum: 70 }
    validates :school, presence :true, length: { maximum: 20 }
    validates :classes, presence :true, length: { maximum: 10 }
    validates :concentration, presence :true
end
