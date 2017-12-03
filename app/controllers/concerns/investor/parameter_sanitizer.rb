class Investor::ParameterSanitizer < Devise::ParameterSanitizer
	def initialize(*)
		super
		permit(:sign_up, keys: [:name])
		permit(:update, keys: [])
	end
end