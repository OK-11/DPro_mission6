class User < ApplicationRecord
  has_many :user_tasks , dependent: :destroy
  has_many :tasks , through: :user_tasks , dependent: :destroy

  has_secure_password

  before_validation {email.downcase!}
  validates :name, presence: { message: "名前を入力してください" }
  validates :email, presence: { message: "メールアドレスを入力してください" }
  validates :email, uniqueness: { message: "メールアドレスはすでに使用されています" }
  validates :password, presence: { message: "パスワードを入力してください" }
  #validates :password_confirmation, presence: { message: "パスワード(確認)を入力してください" }
  validates :password, length: { minimum:6 , message: "パスワードは6文字以上で入力してください" }
  validates :password, confirmation: { message: "パスワード（確認）とパスワードの入力が一致しません" }

end