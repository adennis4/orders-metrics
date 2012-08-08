class CancellationsController < ApplicationController

  def new
    @cancellation = Cancellation.new
  end

  def index
    @stat_array = Cancellation.find_all_by_name("Groupon, Inc.").map { |order| order.metric_1 }
  
    @max = @stat_array.max
    @min = @stat_array.min
  end
end
