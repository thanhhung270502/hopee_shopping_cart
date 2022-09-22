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

# Generate microposts for a subset of users.
# users = User.order(:created_at).take(6)
# 10.times do
#     content = "Và ngày nào đó..."
#     users.each { |user| user.microposts.create!(content: content) }
# end

# Create following relationships.
# users = User.all
# user = users.first
# following = users[2..10]
# followers = users[3..8]
# following.each { |followed| user.follow(followed) }
# followers.each { |follower| follower.follow(user) }

sizes = ["S", "M", "L", "XL", "XXL", "XXXL"];
sizes.each do |size|
    Size.create!(name: size);
end

suggest_contents = ["Chất lượng sản phẩm tuyệt vời", "Đóng gói đẹp và chắc chắn", "Shop phục vụ rất tốt", "Rất đáng tiền", "Giao hàng nhanh"]
suggest_contents.each do |suggest_content|
    Suggest.create!(suggest_content: suggest_content);
end

categorys = ["Business Attire", "Casual", "Formal", "Sports", "Bodysuit"];