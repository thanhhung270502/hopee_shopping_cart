class ApplicationController < ActionController::Base
    include SessionsHelper
    include ShopsHelper
    include ProductsHelper
    include CartSessionsHelper
end
