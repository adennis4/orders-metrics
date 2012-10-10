updateMap = (filter) ->
  this.locationMap Booking.locations, filter

$ ->
  $("body").on "click", "#timeFilters input", (ev) ->
    updateMap ev.currentTarget.value