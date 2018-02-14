class Investor < ApplicationRecord
	has_secure_password
	
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :region, presence: true
    validates :email, presence: true, uniqueness: true

	has_many :currency_investors
	has_many :currencies, through: :currency_investors
	has_many :transactions 
	has_many :corporations, through: :transactions

	def add_currency_investor(currency_params)
        currency_investor = self.currency_investors.find_or_create_by(:currency_id => currency_params["id"])
        currency_investor.total_amount += currency_params["amount"].to_f
        currency_investor.save
    end
end
