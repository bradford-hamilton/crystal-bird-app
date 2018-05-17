require "./spec_helper"

def movie_hash
  {"name" => "Fake", "release_year" => "1"}
end

def movie_params
  params = [] of String
  params << "name=#{movie_hash["name"]}"
  params << "release_year=#{movie_hash["release_year"]}"
  params.join("&")
end

def create_movie
  model = Movie.new(movie_hash)
  model.save
  model
end

class MovieControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe MovieControllerTest do
  subject = MovieControllerTest.new

  it "renders movie index template" do
    Movie.clear
    response = subject.get "/movies"

    response.status_code.should eq(200)
    response.body.should contain("Movies")
  end

  it "renders movie show template" do
    Movie.clear
    model = create_movie
    location = "/movies/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Movie")
  end

  it "renders movie new template" do
    Movie.clear
    location = "/movies/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Movie")
  end

  it "renders movie edit template" do
    Movie.clear
    model = create_movie
    location = "/movies/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Movie")
  end

  it "creates a movie" do
    Movie.clear
    response = subject.post "/movies", body: movie_params

    response.headers["Location"].should eq "/movies"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a movie" do
    Movie.clear
    model = create_movie
    response = subject.patch "/movies/#{model.id}", body: movie_params

    response.headers["Location"].should eq "/movies"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a movie" do
    Movie.clear
    model = create_movie
    response = subject.delete "/movies/#{model.id}"

    response.headers["Location"].should eq "/movies"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
