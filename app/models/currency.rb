class Currency < ApplicationRecord
	has_many :currency_corporations
	has_many :corporations, through: :currency_corporations
	has_many :transactions
	has_many :currency_investors
	has_many :investors, through: :currency_investors
	has_many :corporation_investments
end
