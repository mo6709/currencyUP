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

	private

	def currency_investor_params
		params.require(:currency_investor).permit(:currency_id, :corporation_id, :total_amount)
	end
end