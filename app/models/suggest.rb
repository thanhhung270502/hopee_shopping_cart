class Suggest < ApplicationRecord
    has_many :review_suggests
    has_many :reviews, through: :review_suggests
end
