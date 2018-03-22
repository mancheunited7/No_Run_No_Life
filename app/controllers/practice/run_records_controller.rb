class Practice::RunRecordsController < ApplicationController
  def new
    @practice = RunRecord.new(run_class: 0)
  end
end
