# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
Suburb.delete_all
open("db/suburbs.csv") do |suburbs|
  suburbs.read.each_line do |suburb|
    id,postcode,suburb, aus_post_name, state, latitude,longitude = suburb.chomp.split("|")
    Suburb.create!(:name => aus_post_name, :state => state, :postcode => postcode)
  end
end