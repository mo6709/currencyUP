class CurrencyCorporationSerializer < ActiveModel::Serializer
  attributes :id, :currency_id, :total_amount
end
