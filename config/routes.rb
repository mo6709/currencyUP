Rails.application.routes.draw do 
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'Investor', at: 'investor_auth'
      mount_devise_token_auth_for 'Corporation', at: 'corporation_auth'
      # as :corporation do
      #   # Define routes for Corporation within this block.
      # end
      
      #no authentication needed for these routes
      resources :currencies, :only => [:index, :show]
      resources :corporation_investments, :only => [:index, :show]
      
      #investor authentication needed for these routes
      devise_scope :investor do        
        resources :investor, :only => [] do 
            resources :currency_investors
            resources :transactions
        end
      end
      
      #corporation auhentication needed for these routes 
      devise_scope :corporations do
        resources :corporations, :only => [] do 
          resources :currency_corporations
          resources :corporation_investments
          resources :transactions
        end   
      end
      
    end
  end

end
