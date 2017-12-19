class Api::V1::InvestorsController < Api::V1::BaseController
	def index
		@investors = Investor.all
		
		render json: { 
		    type: "investors",
		    data: @investors 
	    } 		
	end

	def show
		token = request.env["HTTP_AUTHORIZATION"]
		decoded_token = Auth.decode_token(token)
		if token && decoded_token
			@investor = Investor.find_by(:id => params["id"])
		    render json: @investor
		else
			render json: { errors: "Could not find Investor" }, status: 500
		end
	end

	def signup
		investor = Investor.new(investor_params)
		if investor.save
			render json: { token: Auth.create_token(investor) }
		else
			render json: { errors: investor.full_mesages }, status: 500
		end
	end

	def update
		beybug
		@investor = Investor.find_by(:id => params["id"])
		@investor.update(investor_params)
		redirect_to api_v1_investor_path(@investor.id)
	end

	def destroy
		beybug
		@investor.destroy(params["id"])
		redirect_to api_v1_investors_path
	end

	private

	def investor_params
		params.require(:investor).permit(:email, :password, :name)
	end
end