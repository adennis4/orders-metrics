class CancellationsController < ApplicationController

  def new
    @cancellation = Cancellation.new
  end

  def index
    @cancellations = Cancellation.find_all_by_name("Groupon, Inc.").map { |order| order.metric_1 }
  
    @max = @cancellations.max
    @min = @cancellations.min
  end
end
