class Api::V1::CurrencyCorporationsController < Api::V1::BaseController 
	def index
		token = request.env["HTTP_AUTHORIZATION"]
		if token && Auth.decode_token(token)
			render json: { 
			    type: "currency_corporations",
			    data: CurrencyCorporation.all
		    }
		else
			render json: { error: { message: "You must have a valid token!" } }, status: 500
		end     		
	end

	def show
		@currency_corporation = CurrencyCorporation.find_by(:id => params["id"])
        
        render json: {
        	type: "currency_corporation",
        	data: @currency_corporation
        }
	end

	def create
		beybug
		@currency_corporation = CurrencyCorporation.create(currency_corporation_params)
		redirect_to api_v1_currency_corporation_path(@currency_corporation.id)
	end

	def update
		beybug
		@currency_corporation = CurrencyCorporation.find_by(:id => params["id"])
		@currency_corporation.update(currency_corporation_params)
		redirect_to api_v1_currency_corporation_path(@currency_corporation.id)
	end

	def destroy
		beybug
		@currency_corporation.destroy(params["id"])
		redirect_to api_v1_currency_currency_corporations_path
	end

	private

	def currency_corporation_params
		params.require(:currency_corporation).permit(:currency_id, :corporation_id, :total_amount)
	end
end