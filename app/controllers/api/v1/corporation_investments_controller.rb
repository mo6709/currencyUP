class Api::V1::CorporationInvestmentsController <  Api::V1::BaseController
	def index
		@corporation_investments = CorporationInvestment.all
		
		render json: { 
		    type: "corporation_investments",
		    data: @corporation_investments 
	    } 	

	    # make sure to desplay only investments that has the currency of the user's region
	end

	def show
		@corporation_investment = CorporationInvestment.find_by(:id => params["id"])
        
        render json: {
        	type: "corporation_investment",
        	data: @corporation_investment
        }
	end

	def create
		beybug
		@corporation_investment = CorporationInvestment.create(corporation_investment_params)
		redirect_to api_v1_corporation_investment_path(@corporation_investment.id)
	end

	def update
		beybug
		@corporation_investment = CorporationInvestment.find_by(:id => params["id"])
		@corporation_investment.update(corporation_investment_params)
		redirect_to api_v1_corporation_investment_path(@corporation_investment.id)
	end

	def destroy
		beybug
		@corporation_investment.destroy(params["id"])
		redirect_to api_v1_corporation_investments_path
	end

	private

	def corporation_investment_params
		params.require(:corporation_investment).permit(:currency_id, :corporation_id, :retur_rate, :active)
	end
end