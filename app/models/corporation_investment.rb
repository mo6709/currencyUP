class CorporationInvestment < ApplicationRecord
	validates :currency_id, presence: true
    validates :return_rate, presence: true
    validates_inclusion_of :active, :in => [true, false]
    validates :investment_date, presence: true

	belongs_to :currency
	belongs_to :corporation
end
