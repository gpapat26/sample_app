class SessionsController < ApplicationController
  
def create
  user = User.find_by(email: params[:session][:email].downcase)
  if user && user.authenticate(params[:session][:password])
    # Sign the user in and redirect to the user's show page.
      sign_in user
      #redirect_to user
       redirect_back_or user
  else
    flash.now[:error] = 'Invalid email/password combination' # Not quite right!
    render 'new'
  end
end

 def destroy
    sign_out
    redirect_to root_url
  end
  
end


#   if @user.save
#      flash[:success] = "Welcome to the Sample App!"
#     redirect_to @user
#    else
#      render 'new'
#    end