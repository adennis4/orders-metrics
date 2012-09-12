class CancellationsController < ApplicationController

  include CancellationsModule

  def index
    cancellations_hash = get_cancellations
  end
end
