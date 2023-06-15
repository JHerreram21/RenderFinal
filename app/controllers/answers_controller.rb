class AnswersController < ApplicationController
  def index
    @answer = Answer.order(created_at: :desc)
  end
    
  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build
  end
  
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user

    if @answer.save
      redirect_to question_path(@question)
    else
      flash.now[:error] = "Hubo errores al publicar la respuesta."
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @question = @answer.question
    @answer.destroy
    redirect_to question_path(@question)
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
