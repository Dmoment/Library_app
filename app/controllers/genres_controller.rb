class GenresController < ApplicationController
    include Pagy::Backend
    def index
        @pagy, @genres=pagy(Genre.all, items: 4)
    end

    def new
        @genre=Genre.new
    end

    def create
      @genre=Genre.create(genre_params)
      if @genre.save
         flash[:success]= "Your genre has been created successfully"
         redirect_to genres_path
      else
        render 'new'
      end
    end

    def show

    end

    private
    def genre_params
     params.require(:genre).permit(:name)
    end
end
