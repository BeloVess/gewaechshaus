const Plot = createPlotlyComponent(Plotly);

fetch('http://' + location.hostname+ ':8080/api/records')
    .then(response => response.json())
    .then(points => {
      var times = [];
      var values = [];
      points.slice(-20).forEach(element => times.push(element.id));
      points.slice(-20).forEach(element => values.push(element.value));
      ReactDOM.render(
        React.createElement(Plot, {    
          data: [
            {
              type: 'scatter',
              mode: 'lines+points',
              x: times,
              y: values,
              marker: {color: 'red'}
            }
          ],
          layout: {
            width: 1200,
            height: 500,
            title: 'Влажность'
          }
        }),
        document.getElementById('root')
      )}
    );


