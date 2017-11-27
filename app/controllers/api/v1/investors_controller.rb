class Api::V1::InvestorsController < Api::V1::BaseController
	def index
		@investors = Investor.all
		
		render json: { 
		    type: "investors",
		    data: @investors 
	    } 		
	end

	def show
		@investor = Investor.find_by(:id => params["id"])
        @moneyMade = @investor.moneyMade();
        render json: {
        	type: "investor",
        	data: {
        		investor: @investor,
                moneyMade: @moneyMade
        	}
        }
	end

	def create
		beybug
		@investor = Investor.create(investor_params)
		redirect_to investor_path(@investor.id)
	end

	def update
		beybug
		@investor = Investor.find_by(:id => params["id"])
		@investor.update(investor_params)
		redirect_to investor_path(@investor.id)
	end

	def destroy
		beybug
		@investor.destroy(params["id"])
		redirect_to investors_path
	end

	private

	def investor_params
		params.require(:investor).permit(:name, :title)
	end
end