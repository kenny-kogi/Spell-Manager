class Book < ApplicationRecord
    validates :name, presence :true, length: { maximum: 70 }
end
