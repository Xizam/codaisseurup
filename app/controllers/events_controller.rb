class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @events = current_user.events
  end

  def show
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
    if @room.update()
      redirect_to @room, notice: "Event succesfully upated."
    else
      render :edit
    end
  end


  private
  def set_event
    @event =  Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :location, :price, :capacity, :includes_food, :includes_drinks, :starts_at, :end_at, :active)
  end
end
