class Quiz < ApplicationRecord
  before_create :confirmation_token

  belongs_to :user
  belongs_to :entry

  validates_uniqueness_of :voter_ip, :message => "already completed quiz"
  validates_presence_of :email, :message => "you must provide your email address"
  validates_uniqueness_of :email, :message => "already completed quiz"


  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!
    # (:validate => false)
  end

  private
  def confirmation_token
    if self.confirm_token.blank?
        self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end
