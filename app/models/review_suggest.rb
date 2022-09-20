class ReviewSuggest < ApplicationRecord
    belongs_to :review
    belongs_to :suggest
end
