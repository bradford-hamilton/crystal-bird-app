require "./spec_helper"

def bird_hash
  {"name" => "Fake", "age" => "1"}
end

def bird_params
  params = [] of String
  params << "name=#{bird_hash["name"]}"
  params << "age=#{bird_hash["age"]}"
  params.join("&")
end

def create_bird
  model = Bird.new(bird_hash)
  model.save
  model
end

class BirdControllerTest < GarnetSpec::Controller::Test
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

describe BirdControllerTest do
  subject = BirdControllerTest.new

  it "renders bird index template" do
    Bird.clear
    response = subject.get "/birds"

    response.status_code.should eq(200)
    response.body.should contain("Birds")
  end

  it "renders bird show template" do
    Bird.clear
    model = create_bird
    location = "/birds/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Bird")
  end

  it "renders bird new template" do
    Bird.clear
    location = "/birds/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Bird")
  end

  it "renders bird edit template" do
    Bird.clear
    model = create_bird
    location = "/birds/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Bird")
  end

  it "creates a bird" do
    Bird.clear
    response = subject.post "/birds", body: bird_params

    response.headers["Location"].should eq "/birds"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a bird" do
    Bird.clear
    model = create_bird
    response = subject.patch "/birds/#{model.id}", body: bird_params

    response.headers["Location"].should eq "/birds"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a bird" do
    Bird.clear
    model = create_bird
    response = subject.delete "/birds/#{model.id}"

    response.headers["Location"].should eq "/birds"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
