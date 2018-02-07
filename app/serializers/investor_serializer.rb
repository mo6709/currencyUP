class InvestorSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :region, :email, :created_at, :updated_at

    has_many :currency_investors
	has_many :currencies, through: :currency_investors
	has_many :transactions 
	has_many :corporations, through: :transactions
end