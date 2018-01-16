class Api::V1::SessionsController < Api::V1::BaseController
	ERROR_MESSAGE = { message: "Unable to finde an account with that email or password" }

	def investor_login
		investor = Investor.find_by(email: params["email"])
      
		if investor && investor.authenticate(params["password"])
			investor_info = { email: investor.email, id: investor.id, first_name: investor.first_name, last_name: investor.last_name }
			render json: { token: Auth.create_token(investor_info), account_id: investor.id }
		else
			render json: { status: "error", code: 400, messages: "Can't find investor" }, status: 400
		end
	end

	def corporation_login
		corporation = Corporation.find_by(email: params["email"])

		if corporation && corporation.authenticate(params["password"])
			corporation_info = { email: corporation.email, id: corporation.id, name: corporation.name }
			render json: { token: Auth.create_token(corporation_info), account_id: corporation.id }
		else
			render json: { status: "error", code: 400, messages: "Can't find corporation" }, status: 400
		end
	end
end
