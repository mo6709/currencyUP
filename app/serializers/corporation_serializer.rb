class CorporationSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :title, :regions_array, :investment_period
  
    has_many :currency_corporations
	has_many :currencies, through: :currency_corporations
	has_many :transactions
	has_many :investors, through: :transactions
	has_many :corporation_investments
end
