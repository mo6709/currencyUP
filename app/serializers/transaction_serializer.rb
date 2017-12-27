class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :investor, :corporation, :currency_id, :t_type
end
