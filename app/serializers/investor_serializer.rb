class InvestorSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :region, :email
end
