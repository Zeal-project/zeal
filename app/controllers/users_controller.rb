class UsersController < ApplicationController
  def account
  end

  def update
    current_user.update(user_params)
    redirect_to :back
  end

  def fav_companies
    @companies = current_user.fav_companies
  end

  def fav_jobs
    @jobs = current_user.fav_jobs
  end

  protected

  def user_params
    params.require(:user).permit(:name, :tel)
  end

end
