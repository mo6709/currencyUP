class Corporation < ApplicationRecord
	has_many :currency_corporations
	has_many :currencies, through: :currency_corporations
	has_many :transactions
	has_many :investors, through: :transactions
end
