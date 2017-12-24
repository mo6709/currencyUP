class CorporationSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :title, :regions_array, :investment_period

end
