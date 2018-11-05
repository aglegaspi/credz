class ArtistsController < ApplicationController
       before_action :authenticate_user!, :except => [:show, :index]  
    
    def index
        @artists = Artist.all
    end

    def create

        @artist = Artist.create!(artist_params)
    
        respond_to do |format|
            format.html { redirect_to new_credit_path }
            format.js
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
