# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.find_or_create_by!(email: "onigiri@example.com") do |user|
  user.name = "onigiri"
  user.introduction = 'サンプルサンプルサンプル'
  user.password = 'password'
end

user_onigiri = User.find_by(email: "onigiri@example.com")

5.times do |num|
  book = Book.create!(
    title: "Book#{num+1}",
    body: "サンプルサンプルサンプル",
    user_id: user_onigiri.id
  )
  
  PostComment.create!(
    comment: "コメントコメントコメント",
    user_id: user_onigiri.id,
    book_id: book.id
  )
end