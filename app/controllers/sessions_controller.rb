class SessionsController < ApplicationController
    def new
        # this will render the form page
    
    end

    def create
        #this will do the submission of the form
        user = User.find_by(email: params[:session][:email].downcase)
        
        
        if user && user.authenticate(params[:session][:password])
            session[:user_id]=user.id # this will store user's id in the session's hash in the form of cokkie in browser
            flash[:success]="You have successfully logged in"
            redirect_to user_path(user)
        else
            flash.now[:danger]="There is something wrong with your login information"
            render 'new'
        end        

    end
    
   def destroy
    # this will end the session
     session[:user_id]= nil
     flash[:success]="You have been logged out"
     redirect_to root_path
   end
end   
