class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    render "users/new"
  end

  def new
    render "users/new"
  end

  def create
    new_user = User.new(
      name: params[:name],
      role: params[:role],
      password: params[:password],
    )
    if new_user.save
      redirect_to new_sessions_path
      flash[:notice] = "Please Sign in to continue."
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to users_path
    end
  end
end
