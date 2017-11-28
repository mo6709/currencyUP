class Api::V1::CurrencyInvestorsController < Api::V1::BaseController
	def index
		@currency_investors = CurrencyInvestor.all
		
		render json: { 
		    type: "currency_investors",
		    data: @currency_investors 
	    } 		
	end

	def show
		@currency_investor = CurrencyInvestor.find_by(:id => params["id"])
        
        render json: {
        	type: "currency_investor",
        	data: @currency_investor
        }
	end

	def create
		beybug
		@currency_investor = CurrencyInvestor.create(currency_investor_params)
		redirect_to api_v1_currency_investor_path(@currency_investor.id)
	end

	def update
		beybug
		@currency_investor = CurrencyInvestor.find_by(:id => params["id"])
		@currency_investor.update(currency_investor_params)
		redirect_to currency_investor_path(@currency_investor.id)
	end

	def destroy
		beybug
		@currency_investor.destroy(params["id"])
		redirect_to api_v1_currency_currency_investors_path
	end

	private

	def currency_investor_params
		params.require(:currency_investor).permit(:currency_id, :corporation_id, :total_amount)
	end
end