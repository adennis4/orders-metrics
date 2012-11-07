this.App ?= {}
this.App.locationMap = (title, countByCounty, earliestDate) ->

  dateFilters =
    lastYear: +(new Date) - 365 * 24 * 60 * 60 * 1000
    lastQuarter: +(new Date) - 90 * 24 * 60 * 60 * 1000
    lastMonth: +(new Date) - 30 * 24 * 60 * 60 * 1000
    lastWeek: +(new Date) - 7 * 24 * 60 * 60 * 1000

  mapColor =
    bookings: 'Greens q'
    cancellations: 'Reds q'

  tooltipText =
    bookings: 'Booked:  '
    cancellations: 'Cancelled:  '

  displayCounty = (filteredCounties) ->
    $("#map-layout path").attr('class', '')
    maxCount = getMaxCount(filteredCounties)
    for county in filteredCounties
      setAttributes(county, maxCount)
      setHoverTooltip(county.county_code)

  setShade = (count, maxCount) ->
    colorSplit = Math.floor(maxCount / 5)

    if count == 0
      0
    else if count < colorSplit * 1
      1
    else if colorSplit * 1 < count && count < colorSplit * 2
      3
    else if colorSplit * 2 < count && count < colorSplit * 3
      4
    else if colorSplit * 3 < count && count < colorSplit * 4
      6
    else if colorSplit * 4 < count
      7

  setAttributes = (county, maxCount) ->
    $("#" + county.county_code)
      .attr('class', mapColor[title] + setShade(county.count, maxCount) + '-9')
      .attr('title', tooltipText[title] + county.count)

  setHoverTooltip = (county_code) ->
    $('#' + county_code).tooltip()

  getMaxCount = (countByCounty) ->
    countArray = []
    for county in countByCounty
      countArray.push(county.count)
    Math.max(countArray...)

  filterBeforeDate = (countByCounty, earliestDate) ->
    return countByCounty unless earliestDate
    _.filter countByCounty, (county) ->
      county.date_created > earliestDate

  displayCounty filterBeforeDate(countByCounty, dateFilters[earliestDate])
