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
              password_confirmation: password)
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
