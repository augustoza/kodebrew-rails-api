class LecturesController < ApplicationController
  before_action :set_lecture, only: %i[show update destroy]

  def index
    @lectures = Lecture.all

    render json: @lectures
  end

  def show
    render json: @lecture
  end

  def create
    @lecture = Lecture.new(lecture_params)

    if @lecture.save
      render json: @lecture, status: :created
    else
      render json: { error: 'title is mandatory' }, status: 400
    end
  end

  def update
    if @lecture.update(lecture_params)
      render json: @lecture
    else
      render status: 400
    end
  end

  def destroy
    @lecture.destroy
  end

  private

  def set_lecture
    @lecture = Lecture.find(params[:id])
  end

  def lecture_params
    params.require(:lecture).permit(
      :link,
      :description,
      :title,
      :theme,
      :presentation_date
    )
  end
end


# http://localhost:3000/lectures