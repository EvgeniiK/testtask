class Book < ActiveRecord::Base
  belongs_to :user
  has_many :genre_books
  has_many :genres, through: :genre_books
end
