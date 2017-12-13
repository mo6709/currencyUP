class Investor < ApplicationRecord
	has_secure_password
	
	has_many :currency_investors
	has_many :currencies, through: :currency_investors
	has_many :transactions 
	has_many :corporations, through: :transactions
end
