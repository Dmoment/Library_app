class UsersController < ApplicationController
    include Pagy::Backend
    before_action :set_user, only: [:show, :edit, :update]
    before_action :require_same_user, only: [:edit, :update]
    before_action :require_admin, only: [:destroy ]
    
    def new
    @user =User.new
    end

    def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id]=@user.id
      flash[:sucess]="Welcome to the Library app #{@user.username}"
      redirect_to user_path(@user)
    else
        render 'new'
    end        
    end

    def edit
    
    end
    
    def destroy
       @user= User.find(params[:id])
       @user.destroy
       redirect_to users_path
    end

    def update
        
        if @user.update(user_params)
        flash[:success]= "Your account was successfully updated "
        redirect_to books_path
        else
            render 'edit'
        end 
    end
    
    def index
        @pagy, @users=pagy(User.all, items: 4)
    end

    
    def show
   
    end

    private
    def user_params
        params.require(:user).permit(:username,:email,:password)
    end

    def set_user
        @user =User.find(params[:id])  
    end

    def require_same_user
       if current_user!= @user 
        flash[:danger]="You can only modify your details not others"
        redirect_to root_path
       end
    end

    def require_admin
       if logged_in? and !current_user.admin?
        flash[:danger]="Only admin can perform this action"
        redirect_to root_path
       end
    end
end