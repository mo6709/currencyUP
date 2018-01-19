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
		    if (!!params["corporation_id"])
		    	account = Corporation.find_by(:id => id)
		    elsif (!!params["investor_id"])
		    	account = Investor.find_by(:id => id)
		    end 
		    @transaction = account.transactions.create(transaction_params)
		    if @transaction.save
		     #    currency_rate = @transaction.currency.rate
		     #    @transaction.dolar_rate = currency_rate 
		     #    @transaction.save
		    	account_transactions = account.transactions
		    	render json: { type: "transactions", data: account_transactions }, include: ['corporation', 'corporation_investment']
		    else
		    	render json: { status: "error", code: 400, messages: transaction.errors.messages }, status: 400
		    end
		else
			render json: { status: "error", code: 400, messages: "Could not authenticate, try agin" }, status: 400
		end
	end

	def update
		beybug
		@transaction = Transaction.find_by(:id => params["id"])
		@transaction.update(transaction_params)
		redirect_to api_v1_transaction_path(@transaction.id)
	end

	def destroy
		beybug
		@transaction.destroy(params["id"])
		redirect_to api_v1_transaction_path
	end

	private

	def transaction_params
		params.require(:transaction).permit(:corporation_investment_id, :return_rate, :t_type, :corporation_id, :investore_id, :currency_id, :total_amount)
	end
end