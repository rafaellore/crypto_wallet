Rails.application.routes.draw do
  get 'welcome/index'

  get '/inicio', to: 'welcome#index'

  resources :coins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "welcome#index"
end
