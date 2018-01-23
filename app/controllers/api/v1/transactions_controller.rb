class Api::V1::TransactionsController < Api::V1::BaseController
	def index
		@transactions = Transaction.all
		
		render json: { 
		    type: "transactions",
		    data: @transactions 
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
		token = request.env['HTTP_AUTHORIZATION']
		decoded_token = Auth.decode_token(token)
		if token && decoded_token 
			id = decoded_token[0]["account"]["id"]

		    if params["transaction"]["t_type"] === "purchased_by_corp"
		    	@transaction = Transaction.purchased_by_corporation(transaction_params, id)
		    else
		        @transaction = Transaction.check_and_create(transaction_params, id)	
		    end

		    if @transaction.class.name === "Transaction"
		    	render json: { status: "sucess", type: "transaction", data: @transaction }
		    elsif @transaction.class.name === "Hash"
		    	render json: { status: "error", code: 400, messages: @transaction }, code: 400
		    end
		    		
		else
			render json: { status: "error", code: 400, messages: { error: ["Could not authenticate, try agin"] } }, status: 400
		end
	end

	private

	def transaction_params
		params.require(:transaction).permit(:corporation_investment_id, :return_rate, :t_type, :corporation_id, :investore_id, :currency_id, :total_amount)
	end
end