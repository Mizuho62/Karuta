class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :games, dependent: :destroy #追記 ユーザーが削除されたら、ツイートも削除されるようになります。すでに書いてある場合は追記しなくて大丈夫です。
has_many :likes, dependent: :destroy
has_many :liked_games, through: :likes, source: :game
has_many :comments, dependent: :destroy

def already_liked?(game)
  self.likes.exists?(game_id: game.id)
end

mount_uploader :image, ImageUploader

validates :name, presence: true #追記
validates :profile, length: { maximum: 200 } #追記
end
