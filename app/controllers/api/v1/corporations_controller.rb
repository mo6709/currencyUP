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

	# def update
	# 	beybug
	# 	@corporation = Corporation.find_by(:id => params["id"])
	# 	@corporation.update(corporation_params)
	# 	redirect_to api_v1_corporation_path(@corporation.id)
	# end

	# def destroy
	# 	beybug
	# 	@corporation.destroy(params["id"])
	# 	redirect_to api_v1_corporations_path
	# end

	private

	def corporation_params
		params.require(:corporation).permit(:email, :name, :password)
	end
end