class Api::V1::CorporationsController < Api::V1::BaseController
	def index
		@corporations = Corporation.all
		
		render json: { 
		    type: "corporations",
		    data: @corporations 
	    } 		
	end

	def show	 
		token = request.env["HTTP_AUTHORIZATION"]
		decoded_token = Auth.decode_token(token)
        @corporation = Corporation.find_by(:id => params["id"])
		if token && decoded_token
		    render json: @corporation
		elsif 	
			render json: { id: @corporation.id, name: @corporation.name }
		else
			render json: { errors: "Could not find Corporation" }, status: 404
		end
	end		

	def signup
		corporation = Corporation.new(corporation_params)
		if corporation.save
			render json: { token: Auth.create_token(corporation), account_id: corporation.id } 
		else
			render json: { errors: corporation.errors.full_messages }, status: 404
		end
	end

	def update
		binding.pry
        token = request.env["HTTP_AUTHORIZATION"]
        decoded_token = Auth.decode_token(token)
        @corporation = Corporation.find_by(:id => params["id"])

		if token && decoded_token
			@corporation.update(corporation_update_params)
			if @corporation.save
			    render json: @corporation
			else
				render json: { errors: "Account wasnt updated, somthing went wrong" }, status: 404
			end
		else
			rende json: { errors: "Could not authenticate your account" }, status: 404
		end
		
	end

	# def destroy
	# 	beybug
	# 	@corporation.destroy(params["id"])
	# 	redirect_to api_v1_corporations_path
	# end

	private

	def corporation_params
		params.require(:corporation).permit(:email, :name, :title, :password)
	end

	def corporation_update_params
		params.require(:corporation).permit(:email, :name, :title, :investment_period, :regions_array => [])
	end
end