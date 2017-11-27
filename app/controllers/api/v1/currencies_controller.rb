class Api::V1::CurrenciesController < Api::V1::BaseController
	def index
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
		beybug
		@currency = Currency.create(currency_params)
		redirect_to currency_path(@currency.id)
	end

	def update
		beybug
		@currency = Currency.find_by(:id => params["id"])
		@currency.update(currency_params)
		redirect_to currency_path(@currency.id)
	end

	def destroy
		beybug
		@currency.destroy(params["id"])
		redirect_to currencies_path
	end

	private

	def currency_params
		params.require(:currency).permit(:name, :rate, :region)
	end
end
