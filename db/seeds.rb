# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Rails.logger.debug 'Running seeds...'
Rails.logger.debug '=================== Creating Univerties ======================='
30.times do
  University.create(
    name: Faker::University.name,
    location: Faker::Address.country,
    contact_emails: [ Faker::Internet.email, Faker::Internet.email ],
    website: Faker::Internet.url
  )
end
Rails.logger.debug '============= Univerties were created succesfully ============='
