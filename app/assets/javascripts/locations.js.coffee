this.locationMap = (countByState, title) ->

  state = -> for state in countByState
                if (state.count > 0)
                  ez = d3.select("#" + state.state_abbr)
                    .style('fill', -> setColor(state.count))

  setColor = (count) -> if (title == "bookings")
                          return "rgb(0, " + (count * 12) + ", 0)"
                        else if (title == "cancellations")
                          return "rgb(" + (count * 60) + ", 0, 0)"


  state()