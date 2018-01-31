class CorporationSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :title, :regions_array, :investment_period 
    #check http://www.rubydoc.info/gems/active_model_serializers/0.8.2/ActiveModel/Serializer
    #for more options
    has_many :currency_corporations
	has_many :currencies, through: :currency_corporations
	has_many :transactions
	has_many :investors, through: :transactions
	has_many :corporation_investments
end
