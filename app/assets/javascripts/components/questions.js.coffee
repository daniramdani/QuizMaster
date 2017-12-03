@Questions = React.createClass
	getInitialState: ->
    questions: @props.data
  getDefaultProps: ->
    questions: []
  addQuestion: (question) ->
    questions = @state.questions.slice()
    questions.push question
    @setState questions: questions
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
        React.DOM.tbody null,
        	for question in @state.questions
          	React.createElement Question, key: question.id, question: question