class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @feed_items = current_user.feed
    end
    @products = Product.all
  end

  def help
  end

  def blog
  end

  def status
    if logged_in?
      @user = current_user
      @micropost = current_user.microposts.build if logged_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def contact
  end
end
