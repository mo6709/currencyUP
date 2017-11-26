class CurrencyInvestor < ApplicationRecord
	belongs_to :currency
	belongs_to :investor
end
