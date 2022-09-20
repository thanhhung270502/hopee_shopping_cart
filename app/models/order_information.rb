class OrderInformation < ApplicationRecord
  belongs_to :order
  has_many :transports
end
