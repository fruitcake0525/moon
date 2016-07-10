# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u = User.new
u.name = "管理者"
u.email = "admin@test.com"
u.password = "12345678"
u.password_confirmation = "12345678"
u.is_admin = true
u.save

t = User.new
t.name = "RoRTaichung"
t.email = "pass@test.com"
t.password = "12345678"
t.password_confirmation = "12345678"
t.is_admin = false
t.save

p = Project.new
p.mastergoal = "早睡早起"
p.secondgoal = "睡滿八小時"
p.success =  "早上七點自然醒"
p.can = "有可能，只要堅持晚上十一點前睡"
p.how = "如果每天晚上九點洗澡，十點看書助眠"
p.when = "今天最晚十點洗澡，明天九點半洗，大後天九點洗"
p.user_id = "1"
p.owner_name = true
p.save

s = Project.new
s.mastergoal = "學會Rails"
s.secondgoal = "能夠獨立完成一個專案"
s.success =  "有完整CRUD功能，搭配Devise+FBOauth，串接Google Calender提醒"
s.can = "有可能，只要堅持每天完成一個UserStory"
s.how = "避免卡關停頓，每週四參加RoR臺中練功房CodeReview，有問題上GrowthSchool Slack求教"
s.when = "每天的七點到九點是黃金CodingTime"
s.user_id = "2"
s.owner_name = true
s.save
