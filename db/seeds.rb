spinner = TTY::Spinner.new("Creatind coins...", format: :dots)
spinner.auto_spin

coins = [
  {
    description: "Bitcoin",
    acronym: "BTC",
    url_image: "https://assets.coincap.io/assets/icons/btc@2x.png",
  },
  {
    description: "Etherium",
    acronym: "ETH",
    url_image: "https://assets.coincap.io/assets/icons/eth@2x.png",
  },
  {
    description: "Dash",
    acronym: "DASH",
    url_image: "https://assets.coincap.io/assets/icons/dash@2x.png",
  },
]

coins.each do |coin|
  Coin.find_or_create_by!(coin)
end

spinner.success("(✓) Coins created!")
