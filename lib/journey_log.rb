class Journey_Log
  attr_reader :journeys
  attr_reader :charge

  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @journeys = []
    @charge = 0
  end

  def start(entry_station)
    @charge = 0
    current_journey
    if @current_journey.entry_station == nil
      @current_journey.change_entry(entry_station)
    else
      @journeys << @current_journey
      @charge = current_journey.fare
      @current_journey = @journey_class.new
      @current_journey.change_entry(entry_station)
    end
  end

  def finish(exit_station)
    @charge = 0
    current_journey
    @current_journey.change_exit(exit_station)
    @journeys << @current_journey
    @charge = @current_journey.fare
    @current_journey = nil
  end

  def journeys
    @journeys.dup
  end

  private

  def current_journey
    @current_journey ||= @journey_class.new
  end
end
