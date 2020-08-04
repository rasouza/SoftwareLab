class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = Movie.ratings
    @sort = params[:sort] || session[:sort] || 'id'
    @ratings = params[:ratings] || session[:ratings] || Hash[@all_ratings.map { |x| [x,1] }]

    redirect_to movies_path({:ratings => @ratings, :sort => @sort}) if params[:sort].nil? or params[:ratings].nil?

    @movies = Movie.find_all_by_rating(@ratings.keys, :order => @sort)

    session[:sort] = @sort
    session[:ratings] = @ratings
  end

  def new
    @all_ratings = Movie.ratings
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
