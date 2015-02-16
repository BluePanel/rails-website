# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create admin user
admin_user = User.new
admin_user.name = 'Admin'
admin_user.email = 'admin@localhost.localhost'
admin_user.password = '12345678'
admin_user.password = '12345678'
admin_user.add_role :admin
admin_user.save!

# create BluePanel.org project
project = Project.new
project.name = 'BluePanel Website'
project.description = 'The online presence of BluePanel.org'
project.description_de = 'Die Webpräsenz von BluePanel.org'
project.link = 'https://github.com/BluePanel/rails-website'
project.save!

