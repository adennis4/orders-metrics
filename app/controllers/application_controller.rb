class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :create_legend_labels

  def create_legend_labels
    @legend_labels_bookings = [
      {:text => "0 - 20%", :color => "rgb(229,245,224)"},
      {:text => "20 - 40%", :color => "rgb(161,217,155)"},
      {:text => "40 - 60%", :color => "rgb(116,196,118)"},
      {:text => "60 - 80%", :color => "rgb(35,139,69)"},
      {:text => "80 - 100%", :color => "rgb(0,109,44)"}
    ]

    @legend_labels_cancellations = [
      {:text => "0 - 20%", :color => "rgb(254,224,210)"},
      {:text => "20 - 40%", :color => "rgb(252,146,114)"},
      {:text => "40 - 60%", :color => "rgb(251,106,74)"},
      {:text => "60 - 80%", :color => "rgb(203,24,29)"},
      {:text => "80 - 100%", :color => "rgb(165,15,21)"}
    ]
  end
end