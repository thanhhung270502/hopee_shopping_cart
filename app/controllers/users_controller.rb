class UsersController < ApplicationController
    before_action :logged_in_user, only: [:edit, :update, :following, :followers]
    before_action :correct_user, only: [:edit, :update]

    def show
        @user = User.find_by(id: params[:id])
        @microposts = @user.microposts.paginate(page: params[:page])
        @micropost = @user.microposts.build
        @feed_items = current_user.feed.paginate(page: params[:page])
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params) # Not the final implementation!
        if @user.save
            log_in @user
            session[:user_id] = @user.id
            redirect_to root_path
            # redirect_to @user
        else
            render :new
        end
    end

    def setting
        @user = User.find_by(id: params[:id])
    end

    def getAva
        @user = current_user
        # @user.image.attach(params[:user][:image])
    end

    def setAva
        @user = current_user
        @user.image.attach(params[:user][:image])
        if @user.update(user_params)
            # Handle a successful update.
            redirect_to @user
        else
            render 'setAva'
        end
    end 

    def edit
        @user = User.find_by(id: params[:id])
    end        

    def update
        @user = User.find_by(id: params[:id])
        if @user.update(user_params)
            # Handle a successful update.
            redirect_to @user
        else
            render 'edit'
        end
    end

    def index 
        # @users = User.all
        @users = User.paginate(page: params[:page])
        @@current_path = request.url
    end

    def destroy
        User.find(params[:id]).destroy
        redirect_to @@current_path
    end

    def feed
        Micropost.where("user_id = ?", id)
    end

    def following
        @title = "Following"
        @user = User.find(params[:id])
        @users = @user.following.paginate(page: params[:page])
        render 'show_follow', status: :unprocessable_entity
    end
    
    def followers
        @title = "Followers"
        @user = User.find(params[:id])
        @users = @user.followers.paginate(page: params[:page])
        render 'show_follow', status: :unprocessable_entity
    end

    private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone, :address, :web_url, :cover_color, :image);
        end

        # Confirms a logged-in user.


        # Confirms the correct user.
        def correct_user
            @user = User.find_by(id: params[:id])
            redirect_to(root_url) unless current_user?(@user)
        end
end
