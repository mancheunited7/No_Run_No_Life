class CompetitionResult::RunRecordsController < ApplicationController
  def new
    @comp_result = RunRecord.new(run_class: 1)
  end
end
