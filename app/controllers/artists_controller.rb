class ArtistsController < ApplicationController
       before_action :authenticate_user!, :except => [:show, :index]  
    
    def index
        @artists = Artist.all
    end

    def create

        @artist = Artist.new(artist_params)
        
        @artist.save
        
        if @artist.save
            flash[:success] = "That artist was created."
            respond_to do |format|
                format.js
            end
        else
            flash[:error] = "Artist already exists."
            respond_to do |format|
                format.html { render 'artists/_form' }
                format.json { render json: @artist.errors, status: :unprocessable_entity }
            end
            
        end

    end

    def new
        @artist = Artist.new
    end

    def edit 
        @artist = Artist.find(params[:id])
    end

    def show 
        @artist = Artist.find(params[:id])
    end

    def update
        artist = Artist.find(params[:id])
        artist.update(artist_params)
        
        redirect_to artists_path
    end

    def destroy
        Artist.destroy(params[:id])
        redirect_to artists_path
    end

    private
    def artist_params
        
        params.require(:artist).permit(:artist_name)
    end

end
