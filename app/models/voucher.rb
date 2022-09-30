class Voucher < ApplicationRecord
    has_many :user_vouchers
    has_many :users, through: :user_vouchers
end
