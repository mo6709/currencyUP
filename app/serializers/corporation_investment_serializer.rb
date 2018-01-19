class CorporationInvestmentSerializer < ActiveModel::Serializer
    attributes :id, :currency_id, :return_rate, :active, :investment_date, 
    :created_at, :updated_at, :region

    belongs_to :currency
	belongs_to :corporation
end
