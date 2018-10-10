class CardsController < ApplicationController
	skip_before_action :verify_authenticity_token

 	def new
  		@card = Card.new
  		render json: {card: @card}, status: :ok 
 	end

 	def show
		begin
			@card = Card.find(params[:id])
			render json: {card:@card}, status: :ok 
		rescue ActiveRecord::RecordNotFound => e
			render json: {error:e.message}, status: :not_found			
    	end
    end

 	def create
		begin
			@card = Card.new(card_params)
			
			if @card.save
				render json: { card: @card}, status: :created 
			else
				render json: @card.errors, status: :unprocessable_entity 
			end
		rescue ActiveRecord::InvalidForeignKey => e
			render json: {error:'Invalid Foreign Key'}, status: :unprocessable_entity
		end
	end

	def destroy
		begin
			@card = Card.find(params[:id])
			@card.destroy
			render json: {}, status: :ok 
		rescue ActiveRecord::RecordNotFound => e
			render json: {error:e.message}, status: :unprocessable_entity 
		end
	end

	def index
		@cards = Card.all
		render json: {cards:@cards}, status: :ok 
	end

	def edit
		begin
			@card = Card.find(params[:id])
			render json: {card:@card}, status: :ok 
		rescue ActiveRecord::RecordNotFound => e
			render json: {error:e.message}, status: :not_found 
		end
	end

	def update
		begin
			@card = Card.find(params[:id])
			if @card.update(card_params)
				render json: {card:@card}, status: :ok 
			else
				render json: @card.errors, status: :unprocessable_entity 
			end
		rescue => e
			render json: {error:e.message}, status: :unprocessable_entity 
		end
	end
	private
	def card_params
		params.require(:card).permit(:account_id, :card_type, :number, :pin, :limit)
	end
end
