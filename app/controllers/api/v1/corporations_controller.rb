class Api::V1::CorporationsController < Api::V1::BaseController
	def index
		@corporations = Corporation.all
		
		render json: { 
		    type: "corporations",
		    data: @corporations 
	    } 		
	end

	def show
		@corporation = Corporation.find_by(:id => params["id"])
        
        render json: {
        	type: "corporation",
        	data: @corporation
        }
	end

	def create
		beybug
		@corporation = Corporation.create(corporation_params)
		redirect_to corporation_path(@corporation.id)
	end

	def update
		beybug
		@corporation = Corporation.find_by(:id => params["id"])
		@corporation.update(corporation_params)
		redirect_to corporation_path(@corporation.id)
	end

	def destroy
		beybug
		@corporation.destroy(params["id"])
		redirect_to corporations_path
	end

	private

	def corporation_params
		params.require(:corporation).permit(:name, :title)
	end
end