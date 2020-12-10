class Picture < ApplicationRecord
  validates :image, presence: true
  mount_uploader :image, ImageUploader
  validates :sentence, presence: true, length: {maximum:140}
end
