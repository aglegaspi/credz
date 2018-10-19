class ArtistsController < ApplicationController
       before_action :authenticate_user!, :except => [:show, :index]  
    
    def index
        @artists = Artist.all
    end

    def create
        Artist.create(artist_params)
       
        redirect_to artists_path
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
        #will return somethine that looks like this:
        #{name: '...', :description: '...'}
        params.require(:artist).permit(:artist_name)
    end
end
