class UsersController < ApplicationController

  def new
    @user = User.new
  end 

  def show 
    @user = User.find(params[:id]) 
  end

  def create
    @user = User.new(user_params)
      if @user.save
        flash[:success] = "Welcome to the CS450 APP!"
        redirect_to @user
        # Handle a successful save.
      else
        render 'new'
 	end 
  end
   # Miller, Timothy CDT '15 G-4. CDT Miller showed me his code and the proper line to fix user controller for compatibility. West Point, NY 29 September 2014
  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
end

end
