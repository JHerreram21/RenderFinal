class QuestionsController < ApplicationController
  def index
    @products = Product.all
    if params[:product_id].present?
      @filtered_questions = Question.where(product_id: params[:product_id])
    else
      @filtered_questions = Question.all
    end
  end
  
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_name = current_user.name
    @question.created_at = Time.now

    if @question.save
      redirect_to questions_path
    else
      flash.now[:error] = "Hubo errores al crear el producto."
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end
  
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :content, :product_id)
  end
end
