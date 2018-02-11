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
end
