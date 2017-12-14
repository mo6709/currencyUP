class Api::V1::SessionsController < Api::V1::BaseController
	def investor_login
		investor = Corporation.find_by(:email params[:email])

		if investor && investor.authenticate(params[:password])
			render(json: { token: Auth.create_token(investor) })
		else
			render(json: { errors, { 'Fale to login, oleas try again' } }, status: 500)
		end
	end

	def corporation_login
		corporation = Corporation.find_by(:email params[:email])

		if corporation && corporation.authenticate(params[:password])
			render(json: { token: Auth.create_token(corporation) })
		else
			render(json: { errors, { 'Fale to login, oleas try again' } }, status: 500)
		end
	end
end