class Genre < ActiveRecord::Base
  has_many :genre_books
  has_many :books, through: :genre_books
end
