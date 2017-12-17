@AnswerQuestion = React.createClass
	getInitialState: ->
    edit: false
  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit
	handleEdit: (e) ->
    e.preventDefault()
    data =
      answer: ReactDOM.findDOMNode(@refs.answer).value
      question_id: @props.question.id
    $.ajax
      method: 'POST'
      url: "/answer"
      dataType: 'JSON'
      data:
        answer: data
      success: (data) =>
        alert("CORRECT")
        @setState edit: false
        @props.handleEditQuestion @props.question, data, true
      error: (data) =>
        alert("INCORRECT")
        @setState edit: false
        @props.handleEditQuestion @props.question, data, false
	toggleUnit: (e) ->
    e.preventDefault()
	questionRow: ->
		React.DOM.tr null,
			React.DOM.td null, @props.question.question
      React.DOM.td null,
      	React.DOM.button
          className: 'btn btn-primary'
          onClick: @handleToggle
          'Answer'
	questionForm: ->
    React.DOM.tr null,
      React.DOM.td null, 
        @props.question.question
      React.DOM.td null,
        React.DOM.textarea
          className: 'form-control'
          type: 'text'
          defaultValue: ''
          ref: 'answer'
      React.DOM.td null,
        React.DOM.button
          className: 'btn btn-primary'
          onClick: @handleEdit
          'Submit'
        React.DOM.button
          className: 'btn btn-danger'
          onClick: @handleToggle
          'Cancel'          
	render: ->
    if @state.edit
      @questionForm()
    else
      @questionRow()