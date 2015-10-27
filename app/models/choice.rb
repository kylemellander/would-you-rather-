class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :votes

  has_attached_file :img, styles: { medium: "300x300#", thumb: "100x100>" }, default_url: "/download.png"
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\Z/
end
