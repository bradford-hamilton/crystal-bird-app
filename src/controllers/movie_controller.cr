class MovieController < ApplicationController
  def index
    movies = Movie.all
    render("index.slang")
  end

  def show
    if movie = Movie.find params["id"]
      render("show.slang")
    else
      flash["warning"] = "Movie with ID #{params["id"]} Not Found"
      redirect_to "/movies"
    end
  end

  def new
    movie = Movie.new
    render("new.slang")
  end

  def create
    movie = Movie.new(movie_params.validate!)

    if movie.valid? && movie.save
      flash["success"] = "Created Movie successfully."
      redirect_to "/movies"
    else
      flash["danger"] = "Could not create Movie!"
      render("new.slang")
    end
  end

  def edit
    if movie = Movie.find params["id"]
      render("edit.slang")
    else
      flash["warning"] = "Movie with ID #{params["id"]} Not Found"
      redirect_to "/movies"
    end
  end

  def update
    if movie = Movie.find(params["id"])
      movie.set_attributes(movie_params.validate!)
      if movie.valid? && movie.save
        flash["success"] = "Updated Movie successfully."
        redirect_to "/movies"
      else
        flash["danger"] = "Could not update Movie!"
        render("edit.slang")
      end
    else
      flash["warning"] = "Movie with ID #{params["id"]} Not Found"
      redirect_to "/movies"
    end
  end

  def destroy
    if movie = Movie.find params["id"]
      movie.destroy
    else
      flash["warning"] = "Movie with ID #{params["id"]} Not Found"
    end
    redirect_to "/movies"
  end

  def movie_params
    params.validation do
      required(:name) { |f| !f.nil? }
      required(:release_year) { |f| !f.nil? }
    end
  end
end
