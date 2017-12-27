class CorporationInvestmentSerializer < ActiveModel::Serializer
    attributes :id, :currency, :return_rate, :active
end
