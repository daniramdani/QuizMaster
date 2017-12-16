@QuestionForm = React.createClass
  getInitialState: ->
    question: ''
    answer: ''
  handleValueChange: (e) ->
    valueName = e.target.name
    @setState "#{ valueName }": e.target.value
  valid: ->
    @state.question && @state.answer
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { question: @state }, (data) =>
      @props.handleNewQuestion data
      @setState @getInitialState()
    , 'JSON'
  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.textarea
          type: 'textarea'
          id: 'hello'
          className: 'form-control'
          placeholder: 'question'
          name: 'question'
          value: @state.question
          onChange: @handleValueChange
      React.DOM.div
        className: 'form-group'          
        React.DOM.textarea
          type: 'textarea'
          className: 'form-control'
          placeholder: 'answer'
          name: 'answer'
          value: @state.answer
          onChange: @handleValueChange
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          disabled: !@valid()
          'Create Question'