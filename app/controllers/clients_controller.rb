lass ClientsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new
    @client = Client.new
    render json: {client: @client}, status: :ok 
  end

  def show
    begin
		  @client = Client.find(params[:id])
		  render json: {client:@client}, status: :ok 
	  rescue ActiveRecord::RecordNotFound => e
		  render json: {error:e.message}, status: :not_found
    end
  end

  def create
		begin
			@client = Client.new(client_params)
			if @client.save
				render json: { client: @client}, status: :created 
			else
				render json: @client.errors, status: :unprocessable_entity 
			end
		rescue ActiveRecord::InvalidForeignKey => e
			render json: {error:'Invalid Foreign Key'}, status: :unprocessable_entity 
		end
	end

	def destroy
		begin
  		@client = Client.find(params[:id])
			@client.destroy
			render json: {}, status: :ok 
		rescue ActiveRecord::RecordNotFound => e
			render json: {error:e.message}, status: :unprocessable_entity 
		end
	end

	def index
		@client = Client.all
		render json: {client:@client}, status: :ok 
	end

	def edit
		begin
			@client = Client.find(params[:id])
			render json: {client:@client}, status: :ok 
		rescue ActiveRecord::RecordNotFound => e
			render json: {error:e.message}, status: :not_found 
		end
	end

	def update
		begin
			@client = Client.find(params[:id])
			if @client.update(client_params)
				 render json: {client:@client}, status: :ok 
			else
				 render json: @client.errors, status: :unprocessable_entity 
			end
		rescue => e
			render json: {error:e.message}, status: :unprocessable_entity 
		end
	end
	
	private
	  def client_params
		  params.require(:client).permit(:branch_id, :number, :age, :name)
		end
		
end