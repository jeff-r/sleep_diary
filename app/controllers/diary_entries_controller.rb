class DiaryEntriesController < ApplicationController
  before_action :set_diary_entry, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /diary_entries
  # GET /diary_entries.json
  def index
    @diary_entries = current_user.diary_entries.order(:wakeup).reverse_order.to_a
  end

  # GET /diary_entries/1
  # GET /diary_entries/1.json
  def show
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    @diary_entry = DiaryEntry.find(params[:id])
    raise "Diary entry doesn't belong to the current user" unless @diary_entry.user_id == current_user.id
  end

  # GET /diary_entries/new
  def new
    @diary_entry = DiaryEntry.new
    @diary_entry.lights_out = DateTime.yesterday
    @diary_entry.wakeup = DateTime.now
  end

  # GET /diary_entries/1/edit
  def edit
  end

  # POST /diary_entries
  # POST /diary_entries.json
  def create
    @diary_entry = DiaryEntry.new(diary_entry_params)
    current_user.diary_entries << @diary_entry

    respond_to do |format|
      if @diary_entry.save
        format.html { redirect_to @diary_entry, notice: 'Diary entry was successfully created.' }
        format.json { render action: 'show', status: :created, location: @diary_entry }
      else
        format.html { render action: 'new' }
        format.json { render json: @diary_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diary_entries/1
  # PATCH/PUT /diary_entries/1.json
  def update
    respond_to do |format|
      if @diary_entry.update(diary_entry_params)
        format.html { redirect_to @diary_entry, notice: 'Diary entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @diary_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diary_entries/1
  # DELETE /diary_entries/1.json
  def destroy
    @diary_entry.destroy
    respond_to do |format|
      format.html { redirect_to diary_entries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diary_entry
      @diary_entry = DiaryEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diary_entry_params
      params.require(:diary_entry).permit(:lights_out, :wakeup, :notes, :rating, :lights_out_formatted, :wakeup_formatted, :awake_duration)
    end

    def date_and_time_format(datetime)
      datetime.strftime("%Y-%m-%d %H:%M")
    end
end
