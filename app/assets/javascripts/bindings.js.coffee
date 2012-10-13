updateMap = (title, filter) ->
  if title == "bookings"
    this.locationMap title, Booking.locations, filter
  else
    this.locationMap title, Cancellation.locations, filter

$ ->
  $("body").on "click", "#timeFilters input", (ev) ->
    updateMap ev.currentTarget.name, ev.currentTarget.value