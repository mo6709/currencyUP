class Api::V1::CurrenciesController < Api::V1::BaseController
	def index
		# if token && Auth.decode_toke(token).all 
		@currencies = Currency.all
		
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

	def create
		@currency = Currency.create(currency_params)
		redirect_to api_v1_currency_path(@currency.id)
	end

	def update
		beybug
		@currency = Currency.find_by(:id => params["id"])
		@currency.update(currency_params)
		redirect_to api_v1_currency_path(@currency.id)
	end

	def destroy
		beybug
		@currency.destroy(params["id"])
		redirect_to api_v1_currencies_path
	end

	private

	def currency_params
		params.require(:currency).permit(:name, :rate, :region)
	end
end
