class CreditsController < ApplicationController
    before_action :authenticate_user!, :except => [:show, :index]
    
    def index
        @credits = Credit.all
    end

    def create
        @credit = Credit.new(credit_params)

        @credit.save

        if @credit.save
            flash[:success] = 'The credit has been added!'
            redirect_to credits_path
        else
            format.html { render 'form' }
            format.json { render json: @credit.errors, status: :unprocessable_entity }
        end
       
        
    end

    def new
        @credit = Credit.new
        @artist = Artist.new    

    end

    def edit 
        @credit = Credit.find(params[:id])
    end

    def show 
        @credit = Credit.find(params[:id])
    end

    def update
        credit = Credit.find(params[:id])
        credit.update(credit_params)
        
        redirect_to credits_path
    end

    def destroy
        Credit.destroy(params[:id])
        redirect_to credits_path
    end

    private
    def credit_params
        params.require(:credit).permit(:song_title,:mix_version, artist_ids: [])
    end




end
