class GenreBook < ActiveRecord::Base
  belongs_to :genre
  belongs_to :book
end
