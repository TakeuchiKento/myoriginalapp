class Message < ApplicationRecord
    belongs_to :user
    belongs_to :dmroom
    mount_uploader :image, ImageUploader
end
