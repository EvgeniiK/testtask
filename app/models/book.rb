class Book < ActiveRecord::Base
  belongs_to :user
  has_many :genre_books
  has_many :genres, through: :genre_books
  has_attached_file :cover, styles: {medium: "300x200>", thumb: "100x100>"}, default_url: "nobook.png"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
end
