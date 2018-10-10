class TransectionsController < ApplicationController

    skip_before_action :verify_authenticity_token
    
     def new
      @transection = Transection.new
      respond_to do |format|
      format.json { render json: {transection: @transection}, status: :ok }
       end
     end
    
     def show
            begin
                @transection = Transection.find(params[:id])
                respond_to do |format|
                    format.json { render json: {transection:@transection}, status: :ok }
                end
            rescue ActiveRecord::RecordNotFound => e
                respond_to do |format|
                    format.json { render json: {error:e.message}, status: :not_found}
                end
      end
     end
    
     def create
            begin
                @transection = Transection.new(transection_params)
                respond_to do |format|
                    if @transection.save
                        format.json { render json: { transection: @transection}, status: :created }
                    else
                        format.json { render json: @transection.errors, status: :unprocessable_entity }
                    end
                end
            rescue ActiveRecord::InvalidForeignKey => e
                respond_to do |format|
                    format.json { render json: {error:'Invalid Foreign Key'}, status: :unprocessable_entity }
                end
            end
        end
    
        def destroy
            begin
                @transection = Transection.find(params[:id])
                respond_to do |format|
                  @transection.destroy
                    format.json { render json: {}, status: :ok }
                end  
            rescue ActiveRecord::RecordNotFound => e
                respond_to do |format|
                    format.json { render json: {error:e.message}, status: :unprocessable_entity }
                end
            end
        end
    
        def index
            @transection = Transection.all
            respond_to do |format|
                format.json { render json: {transection:@transection}, status: :ok }
            end
        end
    
        def edit
            begin
                @transection = Transection.find(params[:id])
                respond_to do |format|
                    format.json { render json: {transection:@transection}, status: :ok }
                end
            rescue ActiveRecord::RecordNotFound => e
                respond_to do |format|
                    format.json { render json: {error:e.message}, status: :not_found }
                end
            end
        end
    
        def update
            begin
                @transection = Transection.find(params[:id])
                respond_to do |format|
                    if @transection.update(transection_params)
                        format.json { render json: {transection:@transection}, status: :ok }
                    else
                        format.json { render json: @transection.errors, status: :unprocessable_entity }
                    end
                end
            rescue => e
                respond_to do |format|
                    format.json { render json: {error:e.message}, status: :unprocessable_entity }
                end
            end
        end
        private
        def transection_params
            params.require(:transection).permit(:account_id, :amount, :txn_type)
        end
    end