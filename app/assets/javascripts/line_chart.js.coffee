@draw = (json)->
	width = 800
	height = 300
	margin = { top: 20, right: 20, bottom: 30, left: 50}
	parseDate = d3.time.format("%Y-%m-%dT%H:%M:%S.%LZ").parse

	x = d3.time.scale()
		.range [0, width]
	y = d3.scale.linear()
		.range [height, 0]

	xAxis = d3.svg.axis()
		.scale(x)
		.orient 'bottom'
	yAxis = d3.svg.axis()
		.scale(y)
		.orient 'left'

	line = d3.svg.line()
		.x (d)->
			x(d.created_at)
		.y (d)->
			y(d.value)

	svg = d3.select('#chart').append('svg')
		.attr('width', width + margin.left + margin.right)
		.attr('height', height + margin.top + margin.bottom)
		.append('g')
		.attr 'transform', "translate(#{margin.left},#{margin.top})"

	# json = JSON.parse(json)
	# d3.json json, (data)->
	data = json
	data.forEach (d)->
		d.created_at = parseDate(d.created_at)

	x.domain(d3.extent(data, (d)->
			d.created_at
		)
	)
	y.domain(d3.extent(data, (d)->
			d.value
		)
	)

	svg.append('g')
		.attr('class', 'x axis')
		.attr('transform', "translate(0,#{height}")
	svg.append('g')
		.attr('class', 'y axis')
		.call(yAxis)
		.append('text')
		.attr('transform', 'rotate(-90)')
		.attr('y', 6)
		.attr('dy', '.71em')
		.style('text-anchor', 'end')
		.text('Response Time (ms)')
	svg.append('path')
		.datum(data)
		.attr('class', 'line')
		.attr('d', line)