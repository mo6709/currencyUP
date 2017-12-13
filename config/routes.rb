Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do 
      post '/investor_login' => "sessions#investor_login"
      post '/corporation_login' => "sessions#icorporation_login"

      post '/investor_signup' => "investors#signup"
      post '/corporation_signup' => "corporations#signup"

      resources :investors
      resources :corporations

      resources :currencies, :only => [:index, :show]
      resources :corporation_investments, :only => [:index, :show]

      resources :investors, :only => [] do
        resources :currency_investors
        resources :transactions
      end
      
      resources :corporations, :only => [] do
        resources :currency_corporations
        resources :corporation_investments
        resources :transactions
      end
      
    end
  end

end
