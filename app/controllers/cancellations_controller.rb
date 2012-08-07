class CancellationsController < ApplicationController

  def new
    @cancellation = Cancellation.new
  end
end
