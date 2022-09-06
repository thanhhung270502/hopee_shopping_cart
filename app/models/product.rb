class Product < ApplicationRecord
    belongs_to :shop
    has_one_attached :image do |attachable|
        attachable.variant :display, resize_to_limit: [500, 500]
    end

    has_many :product_categories
    has_many :categories, through: :product_categories

    has_many :product_sizes
    has_many :sizes, through: :product_sizes

    validates :image, content_type: { in: %w[image/jpeg image/gif image/png], message: "must be a valid image format" },
                    size: { less_than: 5.megabytes, message: "should be less than 5MB" }
end
