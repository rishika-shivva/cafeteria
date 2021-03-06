class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
  end

  def index
    ensure_owner_logged_in
  end

  def create
    new_user = User.new(
      name: params[:name],
      role: params[:role],
      password: params[:password],
    )
    if new_user.save
      flash[:success] = "Signed up successfully"
      session[:current_user_id] = new_user.id
      redirect_to "/"
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end
end
