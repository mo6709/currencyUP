class Corporation::ParameterSanitizer < Devise::ParameterSanitizer
	def initialize(*)
		super
		permit(:sign_up, keys: [:name])
		permit(:account_update, keys: [:title,:investment_period, {:regions_array => []}])
	end
end