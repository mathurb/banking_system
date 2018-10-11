class TransectionsController < ApplicationController

  skip_before_action :verify_authenticity_token
    
  def new
    @transection = Transection.new
    render json: {transection: @transection}, status: :ok 
  end
    
  def show
    begin
      @transection = Transection.find(params[:id])
      render json: {transection:@transection}, status: :ok 
    rescue ActiveRecord::RecordNotFound => e
      render json: {error:e.message}, status: :not_found
    end
  end
    
  def create
    begin
      @transection = Transection.new(transection_params)
      if @transection.save
        render json: { transection: @transection}, status: :created 
      else
        render json: @transection.errors, status: :unprocessable_entity 
      end
    rescue ActiveRecord::InvalidForeignKey => e
      render json: {error:'Invalid Foreign Key'}, status: :unprocessable_entity 
    end
  end
    
  def destroy
    begin
      @transection = Transection.find(params[:id])
      @transection.destroy
      render json: {}, status: :ok 
    rescue ActiveRecord::RecordNotFound => e
      render json: {error:e.message}, status: :unprocessable_entity 
    end
  end
    
  def index
    @transection = Transection.all
    render json: {transection:@transection}, status: :ok 
  end
    
  def edit
    begin
      @transection = Transection.find(params[:id])
      render json: {transection:@transection}, status: :ok 
    rescue ActiveRecord::RecordNotFound => e
      render json: {error:e.message}, status: :not_found 
    end
  end
    
  def update
    begin
      @transection = Transection.find(params[:id])
      if @transection.update(transection_params)
        render json: {transection:@transection}, status: :ok 
      else
        render json: @transection.errors, status: :unprocessable_entity 
      end
    rescue => e
      render json: {error:e.message}, status: :unprocessable_entity 
    end
  end
  
  private
    def transection_params
      params.require(:transection).permit(:account_id, :amount, :txn_type)
    end

end