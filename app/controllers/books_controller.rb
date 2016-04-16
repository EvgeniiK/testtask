class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  before_action :check_user, only: [:edit, :update, :destroy]
  respond_to :html

  def index
    @books = Book.where('created_at > ?', Time.now - 1.week).where(draft: false)
    respond_with(@books)
  end

  def drafts
    @books = Book.where(user_id: current_user.id).where(draft: true)
    render :index
  end


  def show
    if @book.draft?
      respond_with(@book) unless check_user
    else
      respond_with(@book)
    end
  end

  def new
    @book = Book.new
    respond_with(@book)
  end

  def edit
  end

  def create
    @book = Book.new(book_params.merge(user_id: current_user.id))
    @book.save
    respond_with(@book)
  end

  def update
    @book.update(book_params)
    respond_with(@book)
  end

  def destroy
    @book.destroy
    respond_with(@book)
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:name, :author, :shortdesc, :draft, :cover, genre_ids:[])
    end

    def check_user
      redirect_to(root_path) unless current_user.id == @book.user_id 
    end
end
