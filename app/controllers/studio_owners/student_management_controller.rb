module StudioOwners

  class StudentManagementController < ApplicationController

    def index
      @students = User.where(studio_id: current_studio_owner.studio.id)
    end
  end

end
