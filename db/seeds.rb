# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: 'admin@example.com', password: 'password')

tag_names = %w(
  テスト
  テストA
  テストB
)

# tag_names.each { |name| Tag.create!(tag_name: name) }