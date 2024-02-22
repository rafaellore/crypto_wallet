namespace :dev do
  desc "Run the setup task"
  task setup: :environment do
    if Rails.env.development? 
      show_spinner('Dropping Database...') { %x(rails db:drop) }
      show_spinner('Creating Database...') { %x(rails db:create) }
      show_spinner('Migrating Database...') { %x(rails db:migrate) }
      show_spinner('Seeding Database...') { %x(rails db:seed) }
    else
      puts "You are not in development environment!"
    end
  end

  private
  def show_spinner(message, message_end = 'Done!')
    spinner = TTY::Spinner.new("[:spinner] #{message}", format: :dots)
    spinner.auto_spin
    yield
    spinner.success("(✓) #{message_end}") 
  end
end
