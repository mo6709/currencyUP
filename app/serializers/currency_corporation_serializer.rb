class CurrencyCorporationSerializer < ActiveModel::Serializer
  attributes :id, :currency, :total_amount
end
