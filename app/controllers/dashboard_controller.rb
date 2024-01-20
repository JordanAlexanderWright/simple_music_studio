class DashboardController < ApplicationController
  before_action :authenticate_user!, only: [:users]
  before_action :authenticate_studio_owner!, only: [:studio_owners]
  before_action :check_studio, only: [:studio_owners]
  before_action :check_user_type

  def home
    # If the current users type is a studio owner, redirect to the appropriate page.
    if current_studio_owner
      redirect_to studio_owners_root_path
    elsif current_user
      redirect_to users_root_path
    end
  end

  def users
  end

  def studio_owners
  end

  def check_studio
    unless current_studio_owner.studio
      # Redirect to the studio creation path
      # Replace 'new_studio_path' with the correct path for your application
      redirect_to new_studio_path
    end
    # No need for an 'if' block since you're only handling the case where the studio does not exist
  end

  # If the current users type is a studio owner, redirect to the appropriate page.
  def check_user_type
    # if current_studio_owner
    #   redirect_to studio_owners_dashboard_path
    # end
  end

end

