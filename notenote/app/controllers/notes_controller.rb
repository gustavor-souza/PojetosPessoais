class NotesController < ApplicationController
  before_action :set_note, only:[:destroy,:edit,:update, :show]
  before_action :authenticate_user!
  def index
    @notes = Note.where(user_id: current_user.id).order('created_at DESC')
  end

  def show
  end

  def new
    @note = current_user.notes.build
  end

  def create
    @note = current_user.notes.new(note_params)
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
