

class Entry < ApplicationRecord

  include ActiveModel::Dirty

  belongs_to :user
  has_many :votes
  has_many :voter_users, class_name: "User", through: :votes
  has_many :quizzes

  mount_uploader :avatar, AvatarUploader
  validates :avatar, presence: true

  after_update :clear_filtered_image

  validates :title, length: { maximum: 30 }
  validates :story, length: {
    maximum: 1500,
    minimum: 30,
    tokenizer: lambda { |str| str.scan(/\s+|$/) },
    :too_short => "must have at least %{count} words",
    :too_long  => "must have at most %{count} words"
   }
  validates :title, presence: true
  validates :story, presence: true

  def clear_filtered_image
    if self.avatar_changed? && self.filter == true
      self.filter = nil
    end
  end

  def self.search(search)
    where("location LIKE ? OR location LIKE ? OR location LIKE ? OR location LIKE ? OR location LIKE ?", "%Algonquin Park%", "%Almaguin Highlands%","%Loring-Restoule%","%Muskoka%","%Parry Sound%")
  end


end
