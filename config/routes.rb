Rails.application.routes.draw do 

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'Investor', at: 'investor_auth'
      mount_devise_token_auth_for 'Corporation', at: 'corporation_auth'
      # as :corporation do
      #   # Define routes for Corporation within this block.
      # end
      
      #no authentication needed for these routes
      resources :currencies, :only => [:index, :show] #brake this route to have only waht they need 
      resources :corporation_investments, :only => [:index, :show] #brake this route to have only waht they need 
      resources :corporations, :only => [:index]
      
      #investor/corporation authentication needed for all transaction routes
      resources :transactions
      
      #investor authentication needed for these routes
      devise_scope :investor do        
        resources :investor, :only => [:create, :show, :update, :destroy] do 
          resources :currency_investors
        end
      end
      
      #corporation auhentication needed for these routes 
      devise_scope :corporations do
        resources :corporations, :only => [:show, :create, :update, :destroy] do 
          resources :currency_corporations
          resources :corporation_investments, :only => [:create, :update, :delete]
        end   
      end
      
    end
  end

end
