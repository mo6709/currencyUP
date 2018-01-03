class CorporationInvestmentSerializer < ActiveModel::Serializer
    attributes :id, :currency, :return_rate, :active, :created_at, :updated_at
end
