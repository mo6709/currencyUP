class CurrencyInvestorSerializer < ActiveModel::Serializer
  attributes :id, :total_amount, :currency_id
end
