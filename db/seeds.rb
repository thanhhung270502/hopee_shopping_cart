User.create!(name:                  "Thanh Hùng Lý",
            email:                  "admin@polkadots.com",
            role:                   2,
            password:               "polkadots",
            password_confirmation:  "polkadots",
            phone:                  "0923123123",
            address:                "Kí túc xá Khu A - Đại Học Quốc Gia TP.HCM, Khu phố 6, Phường Linh Trung, Thành Phố Thủ Đức",
            activated:              true,
            activated_at:           Time.zone.now
)


Shop.create!( user_id:      1,
              name:         "Polka Dots",
              description:  "abc");

10.times do |n|
  name = "Thanh Hùng #{n}"
  email = "user#{n+1}@gmail.com"
  password = "password"
  random_phone = rand(1.1..9.9)*100000000
  phone = "0#{random_phone}"
  random_address = rand(1.1..9.9)*100
  address = "#{random_address} Nguyễn Huệ, Quận 15, Thành phố Hồ Chí Minh"
  User.create!(name:                  name,
              email:                  email,
              password:               password,
              password_confirmation:  password,
              phone:                  phone,
              address:                address,
              activated:              true,
              activated_at:           Time.zone.now)
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
  Voucher.create!(name:         "Giảm 20%", 
                  code:         code, 
                  quantity:     5,
                  type_voucher: 0, 
                  discount:     20, 
                  condition:    50, 
                  discount_max: 10)
end

2.times do |n|
  random_number = rand(1.1..9.9)*1000000
  code = random_number.to_i
  Voucher.create!(name:         "FreeShip", 
                  code:         code, 
                  quantity:     5,
                  type_voucher: 1, 
                  discount:     0, 
                  condition:    15, 
                  discount_max: 2)
end