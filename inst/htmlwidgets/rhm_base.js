
HTMLWidgets.widget({

  name: 'rhm_base',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

   
// Prepare random data

	var rmap=Rmap.ToHighmap(x.mapjson)


    // Initiate the chart
    mapChart=Highcharts.mapChart(el, {

        title: {
            text: x.title
        },

        mapNavigation: {
            enabled: true,
            buttonOptions: {
                verticalAlign: 'bottom'
            }
        },

        colorAxis: {
            tickPixelInterval: 100,
			minColor: '#E6E7E8',
			maxColor: x.mapcolor
        },

        series: [{
            data: x.data, 
            mapData: rmap,
            joinBy: [x.jscode, 'codeRHM'],
            keys: [x.jscode, 'value'],
			allowPointSelect: eval(x.perclic),
			name: x.dataname,
            states: {
                hover: {
                    color: x.popcolor
                }
            },
            dataLabels: {
                enabled: true,
                format: '{point.properties.'+x.mapname+'}'
            },
			 tooltip: {
                pointFormat:'{point.properties.'+x.popname+'}:{point.'+x.popvalue+'}'
            }
        }]
    });
	Highcharts.wrap(Highcharts.Point.prototype, 'select', function (proceed) {

            proceed.apply(this, Array.prototype.slice.call(arguments, 1));

            var points = mapChart.getSelectedPoints();
			console.log(points);
			console.log(points[0].properties.state_name);
			Shiny.onInputChange("rhm_clic", eval('{points[0].properties.'+x.clic+'}'));
	});

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});