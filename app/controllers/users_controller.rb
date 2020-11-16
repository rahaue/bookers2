class UsersController < ApplicationController
        
    def index
        @user = User.find_by(id: current_user.id)
        @users = User.all()
        @book = Book.new()
    end
    
    def show
        @user = User.find(params[:id])
        @book = Book.new()
        @books = Book.where(user_id: params[:id])
    end
    
    def edit
        @user = User.find_by(id: params[:id])
        if @user.id == current_user.id
            render "edit"
        else
            redirect_to user_path(current_user.id)
        end
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update(users_params)
            flash[:notice] = "successfully!"
            redirect_to user_path(@user.id)
        else
            @user = @user
            render "edit"
        end
    end
    
    private
    def users_params
        params.require(:user).permit(:name,:profile_image,:introduction)
    end
    
end
