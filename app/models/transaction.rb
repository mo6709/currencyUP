class Transaction < ApplicationRecord
	validates :total_amount, presence: true
	validates :currency_id, presence: true
	validates :investor_id, presence: true
	validates_inclusion_of :t_type, :in => ["to_corp", "from_corp", "purchased_by_corp"]
	validates :total_amount, presence: true
	validates :corporation_id, presence: true

	belongs_to :corporation
	belongs_to :currency
	belongs_to :investor
    belongs_to :corporation_investment

	enum :t_type => [:to_corp, :from_corp, :purchased_by_corp]

	def self.check_and_create(transaction_data, account_id)
		investor = Investor.find_by(:id => account_id)
		corporation = Corporation.find(transaction_data["corporation_id"])
		if transaction_data["t_type"] === "to_corp"
			account = investor
	        funds = account.currency_investors.find_by(:currency_id => transaction_data["currency_id"]).total_amount
	    elsif transaction_data["t_type"] === "from_corp"
	    	account = corporation
            funds = account.currency_corporations.find_by(:currency_id => transaction_data["currency_id"]).total_amount
	    end
	    
	    if funds >= transaction_data["total_amount"].to_f
	    	transaction = account.transactions.create(transaction_data)
	    	if transaction.save
	    		currency_rate = transaction.currency.rate
	    		transaction.dolar_rate = currency_rate
	    		transaction.transfer_amount
	    		return transaction
	    	else
	    		return transaction.errors.messages
	    	end
	    else
	    	return { :error => ["You don't have enough money."] }
	    end
	end

	def self.purchased_by_corporation(transaction_data, account_id)
	end

	def transfer_amount
		currency_corporation = self.corporation.currency_corporations.find(self.currency_id)
		currency_investor = self.investor.currency_investors.find(self.currency_id)

		if self.t_type === "from_corp"
			currency_corporation.total_amount -= self.total_amount
			currency_investor.total_amount += self.total_amount
		elsif self.t_type === "to_corp"
			currency_investor.total_amount -= self.total_amount
			currency_corporation.total_amount += self.total_amount
		end
			
		currency_corporation.save
        currency_investor.save

		self.corporation.save
		self.investor.save
	end
end