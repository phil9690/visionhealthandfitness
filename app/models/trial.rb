class Trial < ApplicationRecord
  before_save { email.downcase! }

  validates :first_name, :last_name, :contact_number, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :contact_number, uniqueness: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  STATUSES = ['PENDING', 'ACCEPTED', 'DECLINED']
end
