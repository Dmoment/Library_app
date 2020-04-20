class GenresController < ApplicationController
    include Pagy::Backend
    before_action :require_admin, except: [:index, :show]
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
      @genre=Genre.find(params[:id])
      @pagy, @genre_books=pagy(@genre.books, items: 4)

    end

    private
    def genre_params
     params.require(:genre).permit(:name)
    end

    def require_admin
      if !logged_in? || (logged_in? and !current_user.admin?)
        flash[:danger]="Only admin can perform that action"
        redirect_to genres_path
      end
    end
      

    
end
