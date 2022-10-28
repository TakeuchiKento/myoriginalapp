class Post < ApplicationRecord
    belongs_to :user

    validates :artist, presence: true
    validates :song, presence: true

    def self.looks(search, word)
        if search == "perfect_match"
          @post = Post.where("artist LIKE?","#{word}")
        elsif search == "partial_match"
          @user = Post.where("artist LIKE?","%#{word}%")
        else
          @post = Post.all
        end
    end
end
