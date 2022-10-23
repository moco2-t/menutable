class HomeController < ApplicationController
    before_action:set_current_user,{skip:[:index]}

    def index

    end

    def about
        
    end

end


