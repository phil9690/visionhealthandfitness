class Message
  include ActiveModel::Model

  attr_accessor :gym, :name, :email, :body, :nickname

  validates :gym, :name, :body, presence: true
  validates :nickname, presence: false

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
end
