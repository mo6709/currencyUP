class Api::V1::CurrenciesController < Api::V1::BaseController
	def index
		# response_format_json(data: Api::V1::PhoneNumberSerializer.new(phone_number).as_json, message: message)
		respond_to do |format|
			format.json { render :json => ["isl", "usd", "ero"] }
		end
	end
end
