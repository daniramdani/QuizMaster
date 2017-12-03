@Question = React.createClass
	getInitialState: ->
    edit: false
  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit
	handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/questions/#{ @props.question.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteQuestion @props.question
	handleEdit: (e) ->
    e.preventDefault()
    data =
      question: ReactDOM.findDOMNode(@refs.question).value
      answer: ReactDOM.findDOMNode(@refs.answer).value
    $.ajax
      method: 'PUT'
      url: "/questions/#{ @props.question.id }"
      dataType: 'JSON'
      data:
        question: data
      success: (data) =>
        @setState edit: false
        @props.handleEditQuestion @props.question, data           
	toggleUnit: (e) ->
    e.preventDefault()
	questionRow: ->
		React.DOM.tr null,
			React.DOM.td null, @props.question.question
      React.DOM.td null, @props.question.answer
      React.DOM.td null,
      	React.DOM.button
          className: 'btn btn-primary'
          onClick: @handleToggle
          'Edit'
        React.DOM.button
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
	questionForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.textarea
          className: 'form-control'
          type: 'text'
          defaultValue: @props.question.question
          ref: 'question'
      React.DOM.td null,
        React.DOM.textarea
          className: 'form-control'
          type: 'text'
          defaultValue: @props.question.answer
          ref: 'answer'
      React.DOM.td null,
        React.DOM.button
          className: 'btn btn-primary'
          onClick: @handleEdit
          'Update'
        React.DOM.button
          className: 'btn btn-danger'
          onClick: @handleToggle
          'Cancel'          
	render: ->
    if @state.edit
      @questionForm()
    else
      @questionRow()