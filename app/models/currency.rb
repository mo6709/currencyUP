class Currency < ApplicationRecord
	has_many :currency_corporations
	has_many :corporations, through: :currency_corporations
	has_many :transactions
	has_many :currency_investors
	has_many :investors, through: :currency_investors
	has_many :corporation_investments

	def self.update_rates
		if(self.find(1).updated_at < Time.now - (60 * 60 * 12))
			fiat_currencies = self.all.find_all{ |c| !c.crypto }
			fiat_currencies.each do |currency|
				rate =  Money.default_bank.get_rate(currency.iso_code, 'USD')
				currency.rate = rate.to_f if rate 
				currency.save
			end
		end
        
        if(self.find(4).updated_at < Time.now - 10)
        	crypto_currencies = self.all.find_all{ |currency| currency.crypto }
	        response = Faraday.get 'https://api.coinmarketcap.com/v1/ticker/?convert=USD&limit=50'
	        repos_array = JSON.parse(response.body)
	        
	        crypto_currencies.each do |currency|
				picket_currency = repos_array.find{ |item| item["symbol"] === currency.iso_code }
				currency.rate = picket_currency["price_usd"].to_f
				currency.save
			end
		end 
	end

	def self.updated_all
		begin 
	        self.update_rates
	        return self.all
	    rescue
	    	return puts "No internet connection"
	    end
	end
end
