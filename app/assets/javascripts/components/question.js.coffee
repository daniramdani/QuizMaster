@Question = React.createClass
	handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/questions/#{ @props.question.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteQuestion @props.question
	render: ->
		React.DOM.tr null,
			React.DOM.td null, @props.question.question
      React.DOM.td null, @props.question.answer
      React.DOM.td null,
        React.DOM.button
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'