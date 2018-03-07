class Currency < ApplicationRecord
    serialize :yearlly_rates, Array
    serialize :monthly_rates, Array
    serialize :dailly_rates, Array


	has_many :currency_corporations
	has_many :corporations, through: :currency_corporations
	has_many :transactions
	has_many :currency_investors
	has_many :investors, through: :currency_investors
	has_many :corporation_investments

	def self.update_rates
		if(self.find_by(:iso_code => "USD").updated_at < Time.now - (60 * 60 * 12))
			fiat_currencies = self.all.find_all{ |c| !c.crypto }
			fiat_currencies.each do |currency|
				self.rates_data(currency)
			end
		end
        
        if(self.find_by(:iso_code => "BTC").updated_at < Time.now - 10)
        	crypto_currencies = self.all.find_all{ |currency| currency.crypto }
	        crypto_currencies.each do |currency|
				self.rates_data(currency)
			end
		end   
	end

	def self.rates_data(currency_object)
		past_12_months_in_seconds =[]
        yearlly_rates_array = []
        past_30_days_in_seconds = []
        monthly_rates_array =[]
        # past_24_hours_in_seconds = []
        # dailly_rates_array = []
        
        31.times.map do |time|
        	past_30_days_in_seconds.push((Date.today - time.days).strftime("%s").to_i)
        	if time <= 12
        	    past_12_months_in_seconds.push((Date.today - time.months).strftime("%s").to_i) 
            end 
            # if time <= 24
            #     past_24_hours_in_seconds.push((Time.now - time.hours).strftime("%s").to_i)
            # end
        end

		base = "https://min-api.cryptocompare.com/data/histoday?fsym=USD"
		tsym = "&tsym=#{currency_object.iso_code}"
		uri = base + tsym + "&limit=370&aggregate=1"
		
		request = Faraday.get(uri)
		response = JSON.parse(request.body)
        response_data = response["Data"]
        
        if response_data.length > 0 
		    past_12_months_in_seconds.each do |secs_int|
		    	rate_object = Sort.find_in_array(response_data, secs_int) 
		        yearlly_rates_array.push(rate_object["close"]) if rate_object
		    end
	        
		    past_30_days_in_seconds.each do |secs_int|
	            rate_object = Sort.find_in_array(response_data, secs_int) 
		        monthly_rates_array.push(rate_object["close"]) if rate_object
		    end
	    end 

	    currency_object.rate= response_data.length > 0 ? response_data.last["close"] : currency_object.rate
        currency_object.yearlly_rates= yearlly_rates_array
        currency_object.monthly_rates= monthly_rates_array
	    currency_object.save 
	end
	
	def self.updated_all
		begin 
	        self.update_rates
	        return self.all
	    rescue
	    	puts "Oops! something went wrong."
	    	return self.all
	    end
	end
end
