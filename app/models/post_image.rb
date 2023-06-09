class Postimage < ApplicationRecord
  has_one_attached :image
    belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
   #shop_nameが存在しているかを確認するバリデーション
  #imageが存在しているかを確認するバリデーション
  belongs_to :user
  def get_image
     has_many :post_comments, dependent: :destroy
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
   def favorited_by?(user)
    favorites.exists?(user_id: user.id)
   end
end
