class Micropost < ApplicationRecord
  belongs_to :user
  has_many :reverses_of_favolites, class_name: "Favorite", foreign_key: "micropost_id"
  has_many :favorite_users , through: :reverses_of_favolites, source: :user
  has_many :reverses_of_favolites, class_name: "Favorite", dependent: :destroy
  
  validates :content, presence: true, length: {maximum: 255}
end