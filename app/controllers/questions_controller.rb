class QuestionsController < ApplicationController
	before_action :set_question, only: [:update, :destroy]

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

  # Created by muh.daniramdani@gmail.com
	# Update a question
	# method : PUT
	# routes : /questions/:id
	# params : id(int), question(string), answer(string)
  def update
    if @question.update(question_params)
      render json: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # Created by muh.daniramdani@gmail.com
	# Answer a question
	# method : POST
	# routes : /answer
	# params : question_id(integer), user_name(string), answer(text)
	def answer
		if is_answer_correct
			@answer = UserAnswer.new(answer_params)
			@answer.save
      render json: @question
    else
      render json: @question, status: :unprocessable_entity
		end
	end


	private

		# Created by muh.daniramdani@gmail.com
		# Check is an Answer correct
		# method : POST
		# routes : /answer
		# params : question_id(integer), user_name(string), answer(text)
		def is_answer_correct
			@question = Question.find(params[:answer][:question_id])
			@question.answer == params[:answer][:answer] ? (return true) : (return false)
		end			

		# Created by muh.daniramdani@gmail.com
		# question permitted params
		# params : question(string), answer(string)
	  def question_params
	    params.require(:question).permit(:question, :answer)
	  end

	  # Created by muh.daniramdani@gmail.com
		# answer permitted params
		# params : question_id(integer), user_name(string), answer(text)
	  def answer_params
	    params.require(:answer).permit(:question_id, :user_name, :answer)
	  end

	  # Created by muh.daniramdani@gmail.com
		# get a question
		# params : id(int)
	  def set_question
			@question = Question.find(params[:id])
		end
end
