@Question = React.createClass
	render: ->
		React.DOM.tr null,
			React.DOM.td null, @props.question.question
      React.DOM.td null, @props.question.answer