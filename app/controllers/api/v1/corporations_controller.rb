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
		elsif @corporation	
			render json: { id: @corporation.id, name: @corporation.name }
		else
			render json: { status: "error", code: 400, messages: { error: ["Could not find Corporation"] } }, status: 400
		end
	end		

	def signup
		corporation = Corporation.new(corporation_params)
		if corporation.save
			render json: { token: Auth.create_token(corporation), account_id: corporation.id } 
		else
			render json: { status: "error", code:400, messages: corporation.errors.messages }, status: 400
		end
	end

	def update
        token = request.env["HTTP_AUTHORIZATION"]
        decoded_token = Auth.decode_token(token) 

		if token && decoded_token
            @corporation = Corporation.find_by(:id => decoded_token[0]["account"]["id"])
			@corporation.update(corporation_update_params)
			if @corporation.save
			    render json: @corporation
			else
				render json: { status: "error", code: 400, messages: @corporation.errors.messages }, status: 400
			end
		else
			render json: { status: "error", code: 400, messages: { error: ["Could not authenticate account"] } }, status: 400
		end
	end

	private

	def corporation_params
		params.require(:corporation).permit(:email, :name, :title, :password)
	end

	def corporation_update_params
		params.require(:corporation).permit(:email, :name, :title, :investment_period, :regions_array => [])
	end
end