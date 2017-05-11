class UrlsController < ApplicationController

    def index
        @url = Url.all
    end

    def new
        @url = Url.new
    end

    def show
        @url = Url.find(params[:id])
    end
    
    
    def create
        @url = Url.new(long_url:params[:url][:long_url])
        @url.short_url = @url.shorten
        if @url.save
            redirect_to urls_path
        else
            @errors = @url.errors.full_messages 
            # flash[:errors] = @url.errors.full_messages   
            render new_url_path
        end
    end
    
    # private

    # def url_params
    #     params.require(:url).permit(:long_url,:short_url)
    # end
end
