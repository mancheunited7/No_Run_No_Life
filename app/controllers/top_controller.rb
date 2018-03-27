class TopController < ApplicationController
  def index
    @users = User.all.order(created_at: "DESC").first(10)
  end
end
