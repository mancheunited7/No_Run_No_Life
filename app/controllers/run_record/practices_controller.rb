class RunRecord::PracticesController < ApplicationController
  def new
    @practice = RunRecord.new
  end
end
