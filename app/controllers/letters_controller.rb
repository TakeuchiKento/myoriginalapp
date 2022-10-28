class LettersController < ApplicationController
    before_action :authenticate_user!, :only => [:create]

def create
    @letter = Letter.create(params.require(:letter).permit(:user_id, :content,:image, :room_id).merge(:user_id => current_user.id))
    end
end
