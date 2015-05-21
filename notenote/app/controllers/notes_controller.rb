class NotesController < ApplicationController
  before_action :set_note, only:[:destroy,:edit,:update, :show]

  def index
    @notes = Note.all.order('created_at DESC')
  end

  def show
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to @note
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @note.update_attributes(note_params)
      redirect_to @note
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_path
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title,:content)
  end
end