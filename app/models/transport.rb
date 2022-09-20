class Transport < ApplicationRecord
  belongs_to :order_information

  default_scope -> { order(created_at: :desc) }
  validates :order_information_id, presence: true
  validates :content, presence: true, length: { maximum: 80 }
end
