class Corporation < ApplicationRecord
	serialize :regions_array, Array
	has_secure_password
    
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates_inclusion_of :investment_period, :in => [2, 4, 6, 8]

	has_many :currency_corporations
	has_many :currencies, through: :currency_corporations
	has_many :transactions
	has_many :investors, through: :transactions
	has_many :corporation_investments
    
    def add_currency_corporation(currency_params)
        currency_corporation = self.currency_corporations.find_or_create_by(:currency_id => currency_params["id"])
        currency_corporation.total_amount += currency_params["amount"].to_f
        currency_corporation.save
    end
end
