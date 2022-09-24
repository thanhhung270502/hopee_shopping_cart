# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(name: "Thanh Hùng Lý",
            email: "admin@polkadots.com",
            password:               "polkadots",
            password_confirmation:  "polkadots"
)

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

categorys = ["Business Attire", "Casual", "Formal", "Sports", "Bodysuit", "Winter", "Summer"];

Shop.create!( user_id: 1,
              name: "Polka Dots",
              description: "abc");

Product.create!()

