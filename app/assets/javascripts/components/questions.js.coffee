@Questions = React.createClass
	getInitialState: ->
    questions: @props.data
  getDefaultProps: ->
    questions: []
  addQuestion: (question) ->
    questions = @state.questions.slice()
    questions.push question
    @setState questions: questions
  deleteQuestion: (question) ->
  	questions = @state.questions.slice()
  	index = questions.indexOf question
  	questions.splice index, 1
  	@replaceState questions: questions
	updateQuestion: (question, data) ->
    index = @state.questions.indexOf question
    questions = React.addons.update(@state.questions, { $splice: [[index, 1, data]] })
    @replaceState questions: questions  	
	render: ->
    React.DOM.div
      className: 'questions'
      React.DOM.h1
        className: 'title'
        'Questions'
      React.createElement QuestionForm, handleNewQuestion: @addQuestion
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Question'
            React.DOM.th null, 'Answer'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
        	for question in @state.questions
          	React.createElement Question, key: question.id, question: question, handleDeleteQuestion: @deleteQuestion, handleEditQuestion: @updateQuestion