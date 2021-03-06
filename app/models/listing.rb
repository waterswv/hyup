class Listing < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  has_attached_file :image, styles: { large: "450x450>", medium: "300x300>", thumb: "100x100#"}
  belongs_to :user
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :address, :title, :rent, :available_date, :description, :contact_phone, :contact_email, presence: true
  validates :contact_phone, numericality: true, length: {minimum: 10, maximum: 15}

end
