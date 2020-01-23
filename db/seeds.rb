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

bodys = [
  'この本は僕が小さい頃母に読んでもらったものです。ひらがなしか出てこないので、老若男女問わず楽しメルと思います。',
  '吾輩がこの本を読んだとき、あまりの衝撃に失神してしまった。一読の価値あり。',
  'ワクワクした～ 読んでちょ',
  'ほんの匂いが良かったと思いまする',
  'なんていうかクリエイティブな気持ちにさせてくれたよ',
  'I feel so happy!!',
  'Do you like something cake?',
  'I have been suffering in the Andes in the past.'
]

comments = [
  'この本に感銘を受けました。',
  '友人に勧めたいと思いました。',
  '僕には理解できない領域だと感じました。',
  'この本を読むと故郷の景色を思い出します（（泣））',
  '僕は本を読むと眠くなるのですが、この本は5分間起きていられました！！',
  'You have a dream.',
  'I can jump from high places'
]

5.times do |num|
  book = Book.create!(
    title: "Book-#{user_onigiri.name}-#{num+1}",
    body: bodys.sample,
    user_id: user_onigiri.id
  )
  
  PostComment.create!(
    comment: comments.sample,
    user_id: user_onigiri.id,
    book_id: book.id
  )

  PostComment.create!(
    comment: comments.sample,
    user_id: user_johnson.id,
    book_id: book.id
  )
end

3.times do |num|
  book = Book.create!(
    title: "Book-#{user_johnson.name}-#{num+1}",
    body: bodys.sample,
    user_id: user_johnson.id
  )
  
  PostComment.create!(
    comment: comments.sample,
    user_id: user_onigiri.id,
    book_id: book.id
  )

  PostComment.create!(
    comment: comments.sample,
    user_id: user_johnson.id,
    book_id: book.id
  )
end