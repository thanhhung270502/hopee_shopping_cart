module ShopsHelper
    def current_shop
        @user = User.find_by(id: session[:user_id])
        if (@user && @user.role >= 1)
            @user.shop  
        else 
            return nil
        end
    end

    def create_shop?
        !current_shop.nil?
    end

    def calcTime(time)
        time_now = Time.now 
        if (time_now.year > time.year)
            return "#{time_now.year - time.year} year ago"
        else
            if (time_now.month > time.month)
                return "#{time_now.month - time.month} month ago"
            else 
                return "#{time_now.day - time.day} day ago"
            end
        end
    end
end