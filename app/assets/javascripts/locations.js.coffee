this.locationMap = (countByCounty, earliestDate) ->

  dateFilters =
    lastYear: +(new Date) - 365 * 24 * 60 * 60 * 1000
    lastQuarter: +(new Date) - 90 * 24 * 60 * 60 * 1000
    lastMonth: +(new Date) - 30 * 24 * 60 * 60 * 1000
    lastWeek: +(new Date) - 7 * 24 * 60 * 60 * 1000
    now: +(new Date)

  this.county = (filteredCounties) ->
    # Something strange about jQuery's interaction with SVG
    $("#map-layout path").attr('class', '')
    maxCount = getMaxCount(filteredCounties)
    for county in filteredCounties
      $("#" + county.county_code)
      .attr('class', 'Blues q' + setShade(county.count, maxCount) + '-9')

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

  getMaxCount = (countByCounty) ->
    countArray = []
    for county in countByCounty
      countArray.push(county.count)
    Math.max(countArray...)

  filterBeforeDate = (countByCounty, earliestDate) ->
    return countByCounty unless earliestDate
    _.filter countByCounty, (county) ->
      county.date_created > earliestDate

  county filterBeforeDate(countByCounty, dateFilters[earliestDate])
