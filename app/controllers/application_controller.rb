class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :create_legend_labels

  def create_legend_labels
    @legend_labels = [
      {:text => "0 - 20%", :color => "rgb(222,235,247)"},
      {:text => "20 - 40%", :color => "rgb(158,202,225)"},
      {:text => "40 - 60%", :color => "rgb(107,174,214)"},
      {:text => "60 - 80%", :color => "rgb(33,113,181)"},
      {:text => "80 - 100%", :color => "rgb(8,81,156)"}
    ]
  end
end
