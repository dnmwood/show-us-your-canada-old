class User < ApplicationRecord

  has_secure_password :validations => false

  has_one :entry
  has_one :vote
  has_one :quiz
  has_one :entry_vote, class_name: "Entry", through: :vote

  # validates :name, :password_digest, :postal_code, :on => :update, presence: true
  validates :email, presence: true, uniqueness: true
  validates :terms_of_service, acceptance: true

  accepts_nested_attributes_for :entry, :allow_destroy => true

  def self.from_omniauth(auth)
    where(auth.slice()).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
