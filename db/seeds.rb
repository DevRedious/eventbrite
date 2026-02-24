# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
puts "Seed: création d'utilisateurs @yopmail.com..."

users_data = [
  { first_name: "Alice", last_name: "Dupont", email: "alice@yopmail.com", description: "Organisatrice" },
  { first_name: "Bob", last_name: "Martin", email: "bob@yopmail.com", description: "Participant" },
  { first_name: "Claire", last_name: "Bernard", email: "claire@yopmail.com", description: "Créatrice d'événements" }
]

users_data.each do |attrs|
  u = User.find_or_initialize_by(email: attrs[:email])
  u.assign_attributes(attrs.merge(encrypted_password: "placeholder_devise_demain"))
  u.save!(validate: false)
end

puts "Seed terminé: #{User.count} utilisateur(s)."

puts "Seed: création d'événements..."

User.limit(2).each_with_index do |user, i|
  Event.find_or_create_by!(title: "Événement test #{i + 1}") do |e|
    e.description = "Description assez longue pour la validation minimale du modèle Event."
    e.start_date = (i + 1).weeks.from_now
    e.duration = 60
    e.price = 10
    e.location = "Lyon"
    e.user = user
  end
end

puts "Event: #{Event.count} événement(s)."
puts "Seed terminé: #{User.count} utilisateur(s) et #{Event.count} événement(s)."