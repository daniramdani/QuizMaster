require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

	describe "GET index" do
    it "assigns @questions" do
      questions = create_list(:question, 3)
      get :index
      
			expect(response.status).to eq(200)      	
      expect(response.content_type).to eq("text/html")
      expect(assigns(:questions).size).to eq(3)
    end
  end

  describe "POST Create" do
    it "success to create a question" do
      post :create, { :question => { :question => "Who is Muhammad?", answer: "Muhammad is a Prophet" } }

			expect(response.status).to eq(200)
			expect(response.content_type).to eq("application/json")
			expect(assigns(:question).answer).to eq("Muhammad is a Prophet")
    end

    it "failed to create a question" do
      post :create, { :question => { :question => ""} }

			expect(response.status).to eq(422)
			expect(assigns(:question).question).to eq("")
			expect(response.content_type).to eq("application/json")
			expect(JSON.parse(response.body)["question"]).to eq(["can't be blank"])
		end
  end

  describe "PUT Update" do
    it "success to update a question" do
    	question = create(:question) 

      put :update, id: question.id, :question => {:question => "Edited - Who is Muhammad?", answer: "Edited - Muhammad is a Prophet" } 

			expect(response.status).to eq(200)
			expect(response.content_type).to eq("application/json")
			expect(assigns(:question).answer).to eq("Edited - Muhammad is a Prophet")
    end

    it "failed to update a question" do
    	question = create(:question)

      put :update, id: question.id, :question => {:question => "", answer: "Edited - Muhammad is a Prophet" } 

			expect(response.status).to eq(422)
			expect(assigns(:question).question).to eq("")
			expect(response.content_type).to eq("application/json")
			expect(JSON.parse(response.body)["question"]).to eq(["can't be blank"])
		end
  end

  describe "DELETE Destroy" do
    it "success to remove a question" do
    	question = create(:question) 

      delete :destroy, id: question.id

			expect(response.status).to eq(204)
			expect(Question.all).to eq([])
    end
  end


  

end
