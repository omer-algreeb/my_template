class AccessController < ActionController::Base

  def index
    # render :html
  end

  def login

  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = User.where(email: params[:email]).first

      if found_user
        # debugger
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "You are logged in."
      redirect_to rails_admin_path
    else
      flash.now[:notice] = "Invalid email/password combination."
      render('login')
    end

  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "logged out."
    redirect_to(access_login_path)

  end
end
