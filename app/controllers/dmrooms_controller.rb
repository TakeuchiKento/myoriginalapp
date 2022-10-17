class DmroomsController < ApplicationController
    before_action :authenticate_user!
  def create
    @dmroom = Dmroom.create
    @entry1 = Entry.create(:dmroom_id => @dmroom.id, :user_id => current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :dmroom_id).merge(:dmroom_id => @dmroom.id))
    redirect_to "/dmrooms/#{@dmroom.id}"
  end

  def show
    @dmroom = Dmroom.find(params[:id])
    if Entry.where(:user_id => current_user.id, :dmroom_id => @dmroom.id).present?
      @messages = @dmroom.messages
      @message = Message.new
      @entries = @dmroom.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end
end