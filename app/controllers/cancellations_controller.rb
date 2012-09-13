class CancellationsController < ApplicationController

  include BookingsModule
  include CancellationsModule

  def index
    @cancellations_hash = get_cancellations
    @title_hash = select_graph(params[:title])
  end

  private

  def select_graph(title)
    case title
    when "bookings"
      get_bookings
    when "weather"
      puts "weather is sunny"
    when "destination"
      puts "destination Bora Bora"
    when "location"
      puts "location nowhere"
    end
  end
end
