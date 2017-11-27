class Api::V1::TransactionsController < Api::V1::BaseController
	def index
		@transaction = Transaction.all
		
		render json: { 
		    type: "transaction",
		    data: @transaction 
	    } 		
	end

	def show
		@transaction = Transaction.find_by(:id => params["id"])
        
        render json: {
        	type: "transaction",
        	data: @transaction
        }
	end

	def create
		beybug
		@transaction = Transaction.create(transaction_params)
		@transaction.rate = Currency.find_by(:id => params["transaction"]["currency_id"]).rate
		redirect_to transaction_path(@transaction.id)
	end

	def update
		beybug
		@transaction = Transaction.find_by(:id => params["id"])
		@transaction.update(transaction_params)
		redirect_to transaction_path(@transaction.id)
	end

	def destroy
		beybug
		@transaction.destroy(params["id"])
		redirect_to transaction_path
	end

	private

	def transaction_params
		params.require(:transaction).permit(:t_type, :corporation_id, :investore_id, :currency_id, :total_amount)
	end
end