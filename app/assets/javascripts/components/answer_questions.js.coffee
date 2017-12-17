@AnswerQuestions = React.createClass
	getInitialState: ->
    questions: @props.data
  getDefaultProps: ->
    questions: []
  updateQuestion: (question, data, status) ->
  	if status
  		alert(status)
    index = @state.questions.indexOf question
    questions = React.addons.update(@state.questions, { $splice: [[index, 1, data]] })
    @replaceState questions: questions    
	render: ->
    React.DOM.div
      className: 'questions'
      React.DOM.a
        href: '/'
        'Back'
      React.DOM.h1
        className: 'title'
        'Questions'
      React.DOM.table
        className: 'table'
        React.DOM.tbody null,
        	for question in @state.questions
          	React.createElement AnswerQuestion, key: question.id, question: question, handleEditQuestion: @updateQuestion