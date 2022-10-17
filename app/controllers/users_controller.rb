class UsersController < ApplicationController
  before_action :authenticate_user!, :only => [:show]

  def index
    @users=User.all
  end

  def show
    @user=User.find(params[:id])
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.dmroom_id == u.dmroom_id then
            @isDmroom = true
            @dmroomId = cu.dmroom_id
          end
        end
      end
      if @isDmroom
      else
        @dmroom = Dmroom.new
        @entry = Entry.new
      end
    end
  end

  def follows
    user = User.find(params[:id])
    @users = user.following_user
  end
  
  def followers
    user = User.find(params[:id])
    @users = user.follower_user
  end
end