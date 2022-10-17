class Room < ApplicationRecord
    has_many :room_users, dependent: :destroy
    has_many :users, through: :room_users, dependent: :destroy
    validates :name, presence: true, uniqueness: true
    has_many :letters, dependent: :destroy
end
