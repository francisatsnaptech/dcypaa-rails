class AttendeesController < ApplicationController
  
  def success
  end
  
  # GET /attendees/new
  def new
    @attendee = Attendee.new
  end
  
  def show
    @attendee = Attendee.find(params[:id])
  end
  
  def edit
    @attendee = Attendee.find(params[:id])
  end
  
  # POST /attendees
  # POST /attendees.json
  def create
    @attendee = Attendee.new(attendee_params)

    respond_to do |format|
      if @attendee.save
        format.html { redirect_to success_path, notice: 'Registration Successful!' }
        format.json { render action: 'show', status: :created, location: @attendee }
      else
        format.html { render action: 'new' }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /attendees/1
  # PATCH/PUT /attendees/1.json
  def update
    
    @attendee = Attendee.find(params[:id])
    
    respond_to do |format|
      if @attendee.update(attendee_params)
        format.html { redirect_to @attendee, notice: 'Attendee Information was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendee
      @attendee = Attendee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendee_params
      params.require(:attendee).permit(:first_name, :last_name, :email, :address, :city, :state, :zip, :aa, :alanon, :alateen, :sobriety_date, :paid)
    end
end
