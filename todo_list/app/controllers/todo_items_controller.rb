class TodoItemsController < ApplicationController
  before_action :set_todo
  before_action :set_todo_item, except: [:create]
  
  def create
    @todo_item = @todo.todo_items.create(todo_item_params)
    redirect_to @todo
  end

  def destroy
    @todo_item = @todo.todo_items.find(params[:id])
    if @todo_item.destroy
      flash[:success] = "Item deletado com sucesso"
    else
      flash[:error] = "Erro ao tentar deletar o item"
    end
    redirect_to @todo
  end

  def complete
    if @todo_item.completed_at.blank?
      @todo_item.update_attribute(:completed_at, Time.zone.now)
    else
      @todo_item.update_attribute(:completed_at, nil)
    end
    redirect_to @todo, notice: "Item completo"
  end

  private
  def set_todo_item
    @todo_item = TodoItem.find(params[:id])
  end

  def set_todo
    @todo = Todo.find(params[:todo_id])
  end

  def todo_item_params
    params[:todo_item].permit(:content)
  end
end
