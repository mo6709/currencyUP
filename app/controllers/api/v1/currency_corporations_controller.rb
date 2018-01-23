class Api::V1::CurrencyCorporationsController < Api::V1::BaseController 
	def index
		token = request.env["HTTP_AUTHORIZATION"]
		if token && Auth.decode_token(token)
			render json: { 
			    type: "currency_corporations",
			    data: CurrencyCorporation.all
		    }
		else
			render json: { messages: { error: ["You must have a valid token!"] } }, status: 500
		end     		
	end

	def show
		@currency_corporation = CurrencyCorporation.find_by(:id => params["id"])
        
        render json: {
        	type: "currency_corporation",
        	data: @currency_corporation
        }
	end

	private

	def currency_corporation_params
		params.require(:currency_corporation).permit(:currency_id, :corporation_id, :total_amount)
	end
end