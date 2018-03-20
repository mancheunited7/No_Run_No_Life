class CompetitionInfosController < ApplicationController
  def new
    @competition_info = CompetitionInfo.new
  end

  def create
  end
end
