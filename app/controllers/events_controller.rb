class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]

  def index
    @events = current_user.events
  end

  def show
    @categories = @event.categories
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event, notice: "New event made."
    else render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Event succesfully upated."
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private
  def set_event
    @event =  Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :location, :price, :capacity, :includes_food, :includes_drinks, :starts_at, :ends_at, :active, category_ids: [])
  end
end
