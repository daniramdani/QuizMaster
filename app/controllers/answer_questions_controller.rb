class AnswerQuestionsController < ApplicationController

	def index
		@questions = Question.all
	end
	
end
