class SessionsController < ApplicationController
  # include SessionsHelper
    before_action :logged_login_to_root, only: [:new, :create]
    def new
    end

    def create
        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password])
            # if user.activated?
            if true
                log_in user
                # remember user
                params[:session][:remember_me] == '1' ? remember(user) : forget(user)
                flash[:success] = "Login successfully !!"
                redirect_back_or user
            else
                message = "Account not activated. "
                message += "Check your email for the activation link."
                flash[:warning] = message
                redirect_to root_url
            end                

            # log_in(user)
            # params[:session][:remember_me] == "1" ? remember(user) : forget(user)
            # redirect_back_or user
            # redirect_to root_path
        else
            flash.now[:danger] = 'Invalid email/password combination'
            render :new
        end


        # user = User.find_by(email: params[:session][:email])
        # if user.present? && user.authenticate(params[:session][:password])
        #     # session[:user_id] = user.id 
        #     log_in user
        #     params[:session][:remember_me] ? remember(user) : forget(user)
        #     redirect_to root_path, notice: "Logged in successfully"
        # else
        #     flash[:alert] = "Invalid email or password"
        #     render :new
        # end
    end

    def destroy
        # session[:user_id] = nil
        log_out if logged_in?
        redirect_to root_path
    end

    def logged_login_to_root
        if logged_in?
            redirect_to root_path
        end
    end
end