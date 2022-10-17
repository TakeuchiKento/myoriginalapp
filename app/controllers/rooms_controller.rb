class RoomsController < ApplicationController
  before_action :set_room, only: [:edit, :update]

    def index
        @room_lists = Room.all
        @room_joining = RoomUser.where(user_id: current_user.id)
        @room_lists_none = "グループに参加していません。"
    end

    def new
        @room = Room.new
        @room.users == current_user
    end

    def create
        @room = Room.new(room_params)
        if @room.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end

    def show
        @room = Room.find(params[:id])
        @letters = @room.letters
        @letter = Letter.new
        @users = @room.user_ids
    end

    def edit
        @room = Room.find(params[:id])
    end

    def update
        @room = Room.find(params[:id])
        if @room.update(room_params)
            redirect_to rooms_path, notice: 'グループを更新しました。'
        else
            render :edit
        end
    end

    def destroy
        room = Room.find(params[:id])
        room.destroy
            redirect_to rooms_path, notice: 'グループを削除しました。'
    end

    private
        def set_room
            @room = Room.find(params[:id])
        end

        def room_params
          params.require(:room).permit(:name,:content, user_ids: [])
      end

end
