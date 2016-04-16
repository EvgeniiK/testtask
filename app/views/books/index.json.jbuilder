json.array!(@books) do |book|
  json.extract! book, :id, :user_id, :name, :author, :shortdesc, :draft
  json.url book_url(book, format: :json)
end
