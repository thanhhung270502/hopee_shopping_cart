class Review < ApplicationRecord
    belongs_to :product

    has_many :review_suggests
    has_many :suggests, through: :review_suggests
end
