# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Coin.create!(
  description: 'Bitcoin',
  acronym: 'BTC',
  url_image: 'https://assets.coincap.io/assets/icons/btc@2x.png'
)

Coin.create!(
  description: 'Etherium',
  acronym: 'ETH',
  url_image: 'https://assets.coincap.io/assets/icons/eth@2x.png'
)

Coin.create!(
  description: 'Dash',
  acronym: 'DASH',
  url_image: 'https://assets.coincap.io/assets/icons/dash@2x.png'

)