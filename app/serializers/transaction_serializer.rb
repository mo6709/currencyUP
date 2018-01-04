class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :investor, :corporation, :currency_id, :t_type, :total_amount, :return_rate, :dolar_rate
end
