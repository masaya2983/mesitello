class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_one_attached :profile_image
   has_many :favorites, dependent: :destroy

def edit
  @user = User.find(params[:id])
end
  # ここまで追加

  @user = User.find(params[:id])
end

def update

  # ここから追加
  user = User.find(params[:id])
  unless user.id == current_user.id
    redirect_to post_images_path
  end
  # ここまで追加

  @user = User.find(params[:id])
  @user.update(user_params)
  redirect_to user_path(@user.id)
end

  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [100, 100]).processed
  end
  # ここから追加
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
  end
  # ここまで追加

end
