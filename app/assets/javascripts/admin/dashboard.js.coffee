$ ->
  $(document).on('change', '#analytic_interval', ->
    $.ajax
      url: "/admin/dashboard/analytic_interval"
      data:
        days: $('#analytic_interval option:selected').val()
      dataType: "script"
  )

AmCharts.ready ->
  if typeof chartData isnt "undefined"
    AmCharts.shortMonthNames = ['Янв.', 'Фев.', 'Март', 'Апр.', 'Май', 'Июнь', 'Июль', 'Авг.', 'Сент.', 'Окт.', 'Нояб.', 'Дек.']

    chart = new AmCharts.AmSerialChart()
    chart.pathToImages = "http://www.amcharts.com/lib/3/images/"
    chart.dataProvider = chartData
    chart.categoryField = "date"
    chart.balloon.bulletSize = 5

    categoryAxis = chart.categoryAxis
    categoryAxis.parseDates = true
    categoryAxis.dataDateFormat = "YYYY.MM.DD"
    categoryAxis.minPeriod = "DD"
    categoryAxis.dashLength = 1
    categoryAxis.minorGridEnabled = true
    categoryAxis.position = 'bottom'

    valueAxis = new AmCharts.ValueAxis()
    valueAxis.axisAlpha = 0
    valueAxis.dashLength = 1
    valueAxis.stackType = "regular"
    chart.addValueAxis(valueAxis)

  #// GRAPH 1
    graph = new AmCharts.AmGraph()
    graph.type = "line"
    graph.title = "Регистрации:"
    graph.valueField = "registrations"
    graph.bullet = "round"
    graph.bulletBorderColor = "#FFFFFF"
    graph.bulletBorderThickness = 2
    graph.bulletBorderAlpha = 1
    graph.lineThickness = 2
  #  graph.lineColor = "#2881b8"
    graph.hideBulletsCount = 50
    graph.lineAlpha = 1
    graph.fillAlphas = 0.4
    chart.addGraph(graph)

    if cname == 'dashboard'
  #// GRAPH 2
      graph = new AmCharts.AmGraph()
      graph.type = "line"
      graph.title = "Рекомендации:"
      graph.valueField = "advises"
      graph.bullet = "round"
      graph.bulletBorderColor = "#FFFFFF"
      graph.bulletBorderThickness = 2
      graph.bulletBorderAlpha = 1
      graph.lineThickness = 2
    #  graph.lineColor = "#2881b8"
      graph.hideBulletsCount = 50
      graph.lineAlpha = 1
      graph.fillAlphas = 0.4
      chart.addGraph(graph)

  #// GRAPH 3
      graph.type = "line"
      graph = new AmCharts.AmGraph()
      graph.title = "Доктора:"
      graph.valueField = "doctors"
      graph.bullet = "round"
      graph.bulletBorderColor = "#FFFFFF"
      graph.bulletBorderThickness = 2
      graph.bulletBorderAlpha = 1
      graph.lineThickness = 2
    #  graph.lineColor = "#2881b8"
      graph.hideBulletsCount = 50
      graph.lineAlpha = 1
      graph.fillAlphas = 0.4
      chart.addGraph(graph)

  #// GRAPH 4
      graph.type = "line"
      graph = new AmCharts.AmGraph()
      graph.title = "Клиники:"
      graph.valueField = "clinics"
      graph.bullet = "round"
      graph.bulletBorderColor = "#FFFFFF"
      graph.bulletBorderThickness = 2
      graph.bulletBorderAlpha = 1
      graph.lineThickness = 2
    #  graph.lineColor = "#2881b8"
      graph.hideBulletsCount = 50
      graph.lineAlpha = 1
      graph.fillAlphas = 0.4
      chart.addGraph(graph)

    legend = new AmCharts.AmLegend()
    legend.position = "top"
    legend.align = "center"
    legend.autoMargins = true
    legend.valueText = "[[value]]"
    legend.valueWidth = 100
    legend.valueAlign = "left"
    legend.equalWidths = false
    legend.periodValueText = "[[value.sum]]"
    chart.addLegend(legend)

  #// CURSOR
    chartCursor = new AmCharts.ChartCursor()
    chartCursor.cursorAlpha = 0
    chart.addChartCursor(chartCursor)

  #// SCROLLBAR
    chartScrollbar = new AmCharts.ChartScrollbar()
    chartScrollbar.color = "#FFFFFF"
    chart.addChartScrollbar(chartScrollbar)

    chart.write("chartdiv")