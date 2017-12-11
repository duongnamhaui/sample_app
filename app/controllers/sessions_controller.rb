class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user
<<<<<<< 7b86d836df3dfb5d4a8e7c498bda66ae0fcda9c5
=======
      remember user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
>>>>>>> Implement advanced login
      redirect_to user
    else
      flash[:danger] = "Invalid email/password combination"
      render :new
    end
  end

  def destroy
<<<<<<< 7b86d836df3dfb5d4a8e7c498bda66ae0fcda9c5
    log_out
=======
    log_out if logged_in?
>>>>>>> Implement advanced login
    redirect_to root_url
  end
end
