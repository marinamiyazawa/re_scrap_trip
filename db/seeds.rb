# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#管理者ログイン情報
Admin.create(
	email: 'mmm@mmm',
	password: 'marina'
)

#ジャンル情報
domestic = Genre.create(:name => "国内")
overseas = Genre.create(:name => "海外")

domestic_genres = domestic.children.create([{:name=>"北海道"}, {:name=>"東北"}, {:name=>"関東"}, {:name=>"中部"}, {:name=>"近畿"}, {:name=>"中国"}, {:name=>"四国"}, {:name=>"九州"}])
overseas_genres = overseas.children.create([{:name=>"アジア"}, {:name=>"ヨーロッパ"}, {:name=>"アフリカ"}, {:name=>"北アメリカ"}, {:name=>"南アメリカ"}, {:name=>"オセアニア"}])
