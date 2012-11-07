updateMap = (title, filter) ->
  if title == "bookings"
    App.locationMap title, Booking.locations, filter
  else
    App.locationMap title, Cancellation.locations, filter

$ ->
  $("body").on "click", "#timeFilters input", (ev) ->
    updateMap ev.currentTarget.name, ev.currentTarget.value