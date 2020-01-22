# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.find_or_create_by!(email: "onigiri@example.com") do |user|
  user.name = "onigiri"
  user.introduction = '趣味はスノーボードです。週イチで長野行ってます'
  user.password = 'password'
end

User.find_or_create_by!(email: "johnson@example.com") do |user|
  user.name = "johnson"
  user.introduction = '最近ペットの小太郎（イヌ）が僕の手を噛んできます'
  user.password = 'password'
end

user_onigiri = User.find_by(email: "onigiri@example.com")
user_johnson = User.find_by(email: "johnson@example.com")

5.times do |num|
  book = Book.create!(
    title: "Book#{num+1}",
    body: "サンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプルサンプル",
    user_id: user_onigiri.id
  )
  
  PostComment.create!(
    comment: "コメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメント",
    user_id: user_onigiri.id,
    book_id: book.id
  )

  PostComment.create!(
    comment: "コメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメント",
    user_id: user_johnson.id,
    book_id: book.id
  )
end