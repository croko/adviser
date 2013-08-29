# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = ['акушерство', 'аллергология', 'андрология', 'венерология', 'гастроэнтерология', 'гематология',
              'гинекология', 'дерматология', 'диетология', 'иммунология', 'инфекционисты', 'кардиология', 'косметология',
              'маммология', 'мануальная терапия', 'наркология', 'неврология', 'нейрохирургия', 'нефрология', 'онкология',
              'ортодонтия', 'ортопедия', 'оториноларингология', 'офтальмология', 'педиатрия', 'пластическая хирургия',
              'психиатрия', 'психология', 'психотерапия', 'пульмонология', 'стоматология', 'трихология', 'урология', 'флебология',
              'эндокринология', 'терапевты', 'хирургия', 'другие услуги']

pages = {index: 'первая страница', category: 'специальности', clinic: 'клиники', doctor: 'доктора'}

categories.each do |category|
  Category.where(name: category).first_or_create
end

pages.each do |nick, name|
 page = Page.where(nickname: nick).first_or_create(name: name)
end

page = Page.where(nickname: 'index').first
Content.where(page_id: page.id, name: 'top').first_or_create
Content.where(page_id: page.id, name: 'left_column').first_or_create
Content.where(page_id: page.id, name: 'center_column').first_or_create
Content.where(page_id: page.id, name: 'right_column').first_or_create

