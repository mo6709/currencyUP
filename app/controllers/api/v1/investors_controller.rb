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
			@investor = Investor.find_by(:id => decoded_token[0]["account"]["id"])
		    render json: @investor
		else
			render json: { status: "error", messages: "Could not find Investor" }, status: 400
		end
	end

	def signup
		investor = Investor.new(investor_params)
		if investor.save
			render json: { token: Auth.create_token(investor), account_id: investor.id }
		else
			render json: { status: "error", code: 400, messages: investor.full_mesages }, status: 400
		end
	end


	def update
        token = request.env["HTTP_AUTHORIZATION"]
        decoded_token = Auth.decode_token(token) 
		if token && decoded_token
            @investor = Investor.find_by(:id => decoded_token[0]["account"]["id"])
			@investor.update(investor_update_params)
			if @investor.save
			    render json: @investor
			else
				render json: { status: "error", code: 400, messages: @investor.errors.messages }, status: 400
			end
		else
			render json: { status: "error", code: 400, messages: "Could not authenticate account" }, status: 400
		end
	end

	def destroy
		beybug
		@investor.destroy(params["id"])
		redirect_to api_v1_investors_path
	end

	private

	def investor_params
		params.require(:investor).permit(:email, :password, :first_name, :last_name)
	end

	def investor_update_params
		params.require(:investor).permit(:email, :first_name, :last_name, :region)
	end
end