class AccountsController < ApplicationController
  
    skip_before_action :verify_authenticity_token
  
  def new
    @account = Account.new
    render json: {account: @account}, status: :ok 
  end
  
  def show
    begin
      @account = Account.find(params[:id])
      render json: {account:@account}, status: :ok 
    rescue ActiveRecord::RecordNotFound => e
      render json: {error:e.message}, status: :not_found
    end
  end
    
  def create
    begin
      @account = account.new(account_params)
      if @account.save
        render json: { account: @account}, status: :created 
      else
        render json: @account.errors, status: :unprocessable_entity 
      end
    rescue ActiveRecord::InvalidForeignKey => e        
      render json: {error:'Invalid Foreign Key'}, status: :unprocessable_entity        
    end
  end
    
  def destroy
    begin
      @account = Account.find(params[:id])
      @account.destroy
      render json: {}, status: :ok  
    rescue ActiveRecord::RecordNotFound => e                    
      render json: {error:e.message}, status: :unprocessable_entity 
    end
  end
    
  def index
    @accounts = Account.all
    render json: {accounts:@accounts}, status: :ok 
  end
    
  def edit
    begin
      @account = Account.find(params[:id])
      render json: {account:@account}, status: :ok 
    rescue ActiveRecord::RecordNotFound => e
      render json: {error:e.message}, status: :not_found 
    end
  end
    
  def update
    begin
      @account = Account.find(params[:id])
      if @account.update(account_params)
        render json: {account:@account}, status: :ok 
      else
        render json: @account.errors, status: :unprocessable_entity 
      end
    rescue => e
      render json: {error:e.message}, status: :unprocessable_entity 
    end
  end
  
  private
    def account_params
      params.require(:account).permit(:amount, :ac_type, :ac_number, :ifsc, :branch_id, :client_id)
    end
    
end