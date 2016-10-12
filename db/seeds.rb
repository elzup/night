user = User.new(
    :name => '歳納京子',
    :email => '99xx999@ms.dendai.ac.jp',
    :password => 'toshino'
)
user.skip_confirmation!
user.save!
puts 'Create 1 User'

admin_user = User.new(
    :name => '岩井',
    :email => 'professor@ms.dendai.ac.jp',
    :password => 'toshino',
    :is_admin => true,
    :admin_code => '123abc',
)
admin_user.skip_confirmation!
admin_user.save!
puts 'Create 1 Admin User'

room = Room.new(:label => '教室', :code => 'aaa111')
room.save!
puts 'Create 1 Room'

s = Date.today - 10.day
e = Date.today + 30.day
(s..e).step(1) do |d|
  Request.create(
      date: d,
      user_id: user.id,
      room_id: room.id,
      admin_id: admin_user.id
  )
end
puts "Create #{Request.count} Request"
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')