
class UserStepsController < ApplicationController
  include Wicked::Wizard
  steps :step_2, :step_3

  def show
    @user = current_user
    render_wizard
  end

  def update
    @user = current_user
    @user.attributes = user_params
    render_wizard @user
  end

  private

  def redirect_to_finish_wizard(options = nil)
    redirect_to root_url, notice: "Thank you for signing up."
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :twitter_username, :github_username, :website, :date_of_birth, :bio)
  end
end
