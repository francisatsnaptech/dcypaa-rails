class MainController < ApplicationController
  def index
    @events = Event.after_today.rchron.limit(2)
  end

  def links
  end

  def events
    @events = Event.after_today.rchron
    @previous_events = Event.past.chron
  end
  
  def contact
  end
  
  def hotel
  end
  
  def info
  end
end
