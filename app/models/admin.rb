class Admin < ApplicationRecord
  mount_uploader :image, ImageUploader
end
