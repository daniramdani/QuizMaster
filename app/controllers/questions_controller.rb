class QuestionsController < ApplicationController
	before_action :set_question, only: [:destroy]

	# Created by muh.daniramdani@gmail.com
	# Get All questions
	# method : GET
	# routes : /questions
	def index
		@questions = Question.all
	end

	# Created by muh.daniramdani@gmail.com
	# Create a question
	# method : POST
	# routes : /questions
	# params : question(string), answer(string)
	def create
		@question = Question.new(question_params)

    if @question.save
      render json: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
	end

	# Created by muh.daniramdani@gmail.com
	# Delete a question
	# method : DELETE
	# routes : /questions/:id
	# params : id(int), question(string), answer(string)
	def destroy
    @question.destroy
    head :no_content
  end


	private

		# Created by muh.daniramdani@gmail.com
		# question permitted params
		# params : question(string), answer(string)
	  def question_params
	    params.require(:question).permit(:question, :answer)
	  end

	  # Created by muh.daniramdani@gmail.com
		# get a question
		# params : id(int)
	  def set_question
			@question = Question.find(params[:id])
		end
end
