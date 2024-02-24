namespace :dev do
  desc "Run the setup task"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Dropping Database...") { %x(rails db:drop) }
      show_spinner("Creating Database...") { %x(rails db:create) }
      show_spinner("Migrating Database...") { %x(rails db:migrate) }
      %x(rails dev:add_coins)
      %x(rails dev:add_mining_types)
    else
      puts "You are not in development environment!"
    end
  end

  desc "Create coins"
  task add_coins: :environment do
    show_spinner("Adding coins...") do
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
    end
  end

  desc "Create mining types"
  task add_mining_types: :environment do
    show_spinner("Adding mining types...") do
      mining_types = [
        {
          name: "Proof of Work",
          acronym: "PoW",
        },
        {
          name: "Proof of Stake",
          acronym: "PoS",
        },
        {
          name: "Proof of Capacity",
          acronym: "PoC",
        },
      ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private

  def show_spinner(message, message_end = "Done!")
    spinner = TTY::Spinner.new("[:spinner] #{message}", format: :dots)
    spinner.auto_spin
    yield
    spinner.success("(✓) #{message_end}")
  end
end
