class VenuesController < ApplicationController

  def index
    matching_venues = Venue.all
    @venues = matching_venues.order(:created_at)

    render({ :template => "venue_templates/venue_list.html.erb" })
  end

  def show
    venue_id = params.fetch("an_id")
    #matching_venues = Venue.where({ :id => venue_id })
    matching_venues = Venue.where({ :id => venue_id })    
    @the_venue = matching_venues.at(0)

    render({ :template => "venue_templates/details.html.erb" })
  end

  def create
    # query_address = params.fetch("query_address")
    # query_name = params.fetch("query_name")
    # query_neighborhood = params.fetch("query_neighborhood")
    # venue = Venue.new
    # venue.address = query_address
    # venue.name = query_name
    # venue.neighborhood = query_neighborhood
    # venue.save

    venue = Venue.new
    venue.address = params.fetch("query_address")
    venue.name = params.fetch("query_name")
    venue.neighborhood = params.fetch("query_neighborhood")
    venue.save

    #redirect_to("/venues/#{venue.name}")
    redirect_to("/venues/#{@the_venue.id}")
  end
  
  def update
    the_id = params.fetch("the_id")
    matching_venue = Venue.where({ :id => the_id })
    venue = matching_venue.at(0)
    venue.address = params.fetch("query_address")
    venue.name = params.fetch("query_name")
    venue.neighborhood = params.fetch("query_neighborhood")
    venue.save
    
    redirect_to("/venues/#{venue.id}")
  end

  def destroy

    #Parameters: {"id_to_delete"=>"43"}
    the_id = params.fetch("id_to_delete")
    matching_venues = Venue.where({ :id => the_id })
    venue = matching_venues.at(0)
    venue.destroy

    redirect_to("/venues")
  end

end
