
class Event < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true
  validates :location, presence: true
  validates :city, presence: true
  validates :event_time, presence: true
  validates :description, presence: true


  mount_uploader :photo, PhotoUploader
  belongs_to :user

  geocoded_by :location
  after_validation :geocode, if: :location_changed?
end
