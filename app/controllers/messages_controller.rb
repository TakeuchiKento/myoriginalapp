class MessagesController < ApplicationController
    before_action :authenticate_user!, :only => [:create]
  
    def create
      if Entry.where(:user_id => current_user.id, :dmroom_id => params[:message][:dmroom_id]).present?
        @message = Message.create(params.require(:message).permit(:user_id, :body, :dmroom_id).merge(:user_id => current_user.id))
        redirect_to "/dmrooms/#{@message.dmroom_id}"
      else
        redirect_back(fallback_location: root_path)
      end
    end
  end