class CurrencyCorporation < ApplicationRecord
	belongs_to :currency
	belongs_to :corporation
end
