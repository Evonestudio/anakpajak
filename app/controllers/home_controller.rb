class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    @user = User.new
    @questions = Question.all.page(params[:page])
    # debugger
  end
  def timeline
    @activities = PublicActivity::Activity.all  
    @template   = "timeline"
  end
end
