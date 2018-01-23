class Api::V1::CorporationInvestmentsController <  Api::V1::BaseController
	def index
		@corporation_investments = CorporationInvestment.all
		
		render json: { 
		    type: "corporation_investments",
		    data: @corporation_investments 
	    }
	end

	def show
		@corporation_investment = CorporationInvestment.find_by(:id => params["id"])
        
        render json: {
        	type: "corporation_investment",
        	data: @corporation_investment
        }
	end

	def create
		token = request.env["HTTP_AUTHORIZATION"]
		decoded_token = Auth.decode_token(token)
		if token && decoded_token 
			corp_id = decoded_token[0]["account"]["id"]
			corporation = Corporation.find_by(:id => corp_id)
			corporation.corporation_investments.create(corporation_investment_params)
			if corporation.save
				@corporation_investments = corporation.corporation_investments
				render json: { data: @corporation_investments }
			else
				render json: { status: 'error', code: 400, messages: corporation.errors.messages }, status: 400
			end
		else
			render json: { status: 'error', code: 400, messages: { error: ["Could not authenticate Corporation"] } }, status: 400
		end
	end

	private

	def corporation_investment_params
		params.require(:corporation_investment).permit(:currency_id, :return_rate, :active, :investment_date, :region)
	end
end