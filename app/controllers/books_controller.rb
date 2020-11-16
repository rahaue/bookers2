class BooksController < ApplicationController
    
    def index
        @user = User.find_by(id: current_user.id)
        @book = Book.new()
        @books = Book.all()
    end
    
    def show
        @book = Book.new()
        @book_body = Book.find(params[:id])
        @user = User.find(@book_body.user_id)
    end
    
    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
            flash[:notice] = "You have created book successfully."
            redirect_to book_path(@book.id)
        else
            @user = User.find_by(id: current_user.id)
            @book = @book
            @books = Book.all()
            render "index"
        end
    end
    
    def edit
        @book = Book.find(params[:id])
        if @book.user_id == current_user.id
            # renderでview名指定して呼び出し
            render "edit"
        else
            redirect_to books_path
        end
        
    end
    
    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            flash[:notice] = "You have updated book successfully."
            redirect_to book_path(@book.id)
        else
            @book = @book
            render "edit"
        end
    end
    
    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end
    
    # ストロングパラメータ
    private
    def book_params
        params.require(:book).permit(:title, :body)
    end
    
end
