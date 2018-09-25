class GroupLessonsController < ApplicationController
  before_action :set_group_lesson, only: [:show, :edit, :update, :destroy]

  # GET /group_lessons
  # GET /group_lessons.json
  def index
    @group_lessons = GroupLesson.all
  end

  # GET /group_lessons/1
  # GET /group_lessons/1.json
  def show
  end

  # GET /group_lessons/new
  def new
    @group_lesson = GroupLesson.new
  end

  # GET /group_lessons/1/edit
  def edit
  end

  # POST /group_lessons
  # POST /group_lessons.json
  def create
    @group_lesson = GroupLesson.new(group_lesson_params)

    respond_to do |format|
      if @group_lesson.save
        format.html { redirect_to @group_lesson, notice: 'Group lesson was successfully created.' }
        format.json { render :show, status: :created, location: @group_lesson }
      else
        format.html { render :new }
        format.json { render json: @group_lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_lessons/1
  # PATCH/PUT /group_lessons/1.json
  def update
    respond_to do |format|
      if @group_lesson.update(group_lesson_params)
        format.html { redirect_to @group_lesson, notice: 'Group lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_lesson }
      else
        format.html { render :edit }
        format.json { render json: @group_lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_lessons/1
  # DELETE /group_lessons/1.json
  def destroy
    @group_lesson.destroy
    respond_to do |format|
      format.html { redirect_to group_lessons_url, notice: 'Group lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_lesson
      @group_lesson = GroupLesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_lesson_params
      params.require(:group_lesson).permit(:teacher_id, :status, :program_id, :start, :max_seat, :duration, :google_calendar_event_id, :lesson_id, :teachable_within_24h, :gsa_class_id)
    end
end
