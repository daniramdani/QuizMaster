class QuestionsController < ApplicationController

	# Created by muh.daniramdani@gmail.com
	# Get All questions
	# method : GET
	# routes : /questions
	def index
		@questions = Question.all
	end
	
end
