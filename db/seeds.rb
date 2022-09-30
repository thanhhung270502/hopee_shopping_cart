User.create!(name: "Thanh Hùng Lý",
            email: "admin@polkadots.com",
            role: 2,
            password:               "polkadots",
            password_confirmation:  "polkadots",
            activated: true,
            activated_at: Time.zone.now
)


Shop.create!( user_id: 1,
              name: "Polka Dots",
              description: "abc");

10.times do |n|
  name = "Thanh Hùng #{n}"
  email = "user#{n+1}@gmail.com"
  password = "password"
  User.create!(name: name,
              email: email,
              password: password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now
            )
end

sizes = ["S", "M", "L", "XL", "XXL", "XXXL"];
sizes.each do |size|
  Size.create!(name: size);
end

suggest_contents = ["Chất lượng sản phẩm tuyệt vời", "Đóng gói đẹp và chắc chắn", "Shop phục vụ rất tốt", "Rất đáng tiền", "Giao hàng nhanh"]
suggest_contents.each do |suggest_content|
  Suggest.create!(suggest_content: suggest_content);
end

categories = ["Business Attire", "Casual", "Formal", "Sports", "Bodysuit", "Winter", "Summer"];
categories.each do |category|
  Category.create!(name: category);
end

2.times do |n|
  random_number = rand(1.1..9.9)*1000000
  code = random_number.to_i
  Vouhcer.create!(name: "Giảm 20%", code: code, quantity: 5,
                  type_voucher: 0, discount: 20, condition: 50, discount_max: 10)
end

2.times do |n|
  random_number = rand(1.1..9.9)*1000000
  code = random_number.to_i
  Vouhcer.create!(name: "FreeShip", code: code, quantity: 5,
                  type_voucher: 1, discount: 0, condition: 15, discount_max: 2)
end