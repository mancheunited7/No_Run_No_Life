class MypagesController < ApplicationController
  def index
    @practices = RunRecord.where(run_class: 0).order(run_record_day: "DESC").first(5)
    @comp_results = RunRecord.where(run_class: 1).order(run_record_day: "DESC").first(5)
  end
end
