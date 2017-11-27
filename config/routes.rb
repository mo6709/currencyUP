Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do 
      resources :currencies
      resources :currency_investors
      resources :currency_corporations
      resources :transactions
      resources :investors
      resources :corporations
      resources :corporation_investments
    end
  end

end
