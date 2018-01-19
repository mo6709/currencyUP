class Api::V1::CurrenciesController < Api::V1::BaseController
	def index
		@currencies = Currency.updated_all
		
		render json: { 
		    type: "currencies",
		    data: @currencies 
	    } 		
	end

	def show
		@currency = Currency.find_by(:id => params["id"])
        
        render json: {
        	type: "currency",
        	data: @currency
        }
	end

	private

	def currency_params
		params.require(:currency).permit(:name, :rate, :region)
	end
end
