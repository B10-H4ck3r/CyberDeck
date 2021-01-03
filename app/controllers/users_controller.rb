class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to CyberDeck!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:fname, :lname, :uname, :tel, :email, :bio, :job_title, :job_comp, :job_bio, :clg_degree, :clg_name, :password, :password_confirmation)
  end
end
