class TopController < ApplicationController
  def index
    @users = User.all.order(created_at: "DESC").first(6)
    @run_records = RunRecord.recent_run_record_find(@users)
  end
end
