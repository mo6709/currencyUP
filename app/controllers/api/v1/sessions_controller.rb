class Api::V1::SessionsController < Api::V1::BaseController
	def investor_login
		investor = Corporation.find_by(:email params[:email])

		if investor && investor.authenticate(params[:password])
			render(json: { token: Auth.create_token({ email: investor.email, id: investor.id, name: investor.name }) }
		else
			render(json: { message: { "Unable to finde an account with that email or password" } }, status: 500)
		end
	end

	def corporation_login
		corporation = Corporation.find_by(:email params[:email])

		if corporation && corporation.authenticate(params[:password])
			render json: { token: Auth.create_token({ email: corporation.email, id: corporation.id, name: corporation.name }) }
		else
			render json: { errors, { "Unable to finde an account with that email or password" } }, status: 500
		end
	end
end