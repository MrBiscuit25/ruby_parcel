class Parcel < ApplicationRecord
  validates :title, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :middle_name, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :weight, presence: true
  validates :length, presence: true
  validates :width, presence: true
  validates :height, presence: true
  validates :origin, presence: true
  validates :destination, presence: { message: ': provide correct origin and destination' }
  validates :distance, presence: { message: ': provide correct origin and destination' }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "destination", "distance", "email", "first_name", "height",
      "id", "id_value", "last_name", "length", "middle_name", "origin",
      "phone", "price", "title", "updated_at", "weight", "width"]
  end
end
