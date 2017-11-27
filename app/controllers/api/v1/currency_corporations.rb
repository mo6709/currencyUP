class Api::V1::CurrencyCurrencyCorporations < Api::V1::BaseController 
	def index
		@currency_corporations = CurrencyCorporation.all
		
		render json: { 
		    type: "currency_corporations",
		    data: @currency_corporations 
	    } 		
	end

	def show
		@currency_corporation = CurrencyCorporation.find_by(:id => params["id"])
        
        render json: {
        	type: "currency_corporation",
        	data: @currency_corporation
        }
	end

	def create
		beybug
		@currency_corporation = CurrencyCorporation.create(currency_corporation_params)
		redirect_to currency_corporation_path(@currency_corporation.id)
	end

	def update
		beybug
		@currency_corporation = CurrencyCorporation.find_by(:id => params["id"])
		@currency_corporation.update(currency_corporation_params)
		redirect_to currency_corporation_path(@currency_corporation.id)
	end

	def destroy
		beybug
		@currency_corporation.destroy(params["id"])
		redirect_to currency_currency_corporations_path
	end

	private

	def currency_corporation_params
		params.require(:currency_corporation).permit(:currency_id, :corporation_id, :total_amount)
	end
end