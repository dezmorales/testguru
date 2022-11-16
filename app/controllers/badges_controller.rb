class BadgesController < ApplicationController
  before_action :set_badges, only: %i[index]

  def index

  end

  private

  def set_badges
    @badges = Badge.all
    @user_badges = current_user.badges
  end

end
