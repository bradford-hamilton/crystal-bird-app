class BirdController < ApplicationController
  def index
    birds = Bird.all
    render("index.slang")
  end

  def show
    if bird = Bird.find params["id"]
      render("show.slang")
    else
      flash["warning"] = "Bird with ID #{params["id"]} Not Found"
      redirect_to "/birds"
    end
  end

  def new
    bird = Bird.new
    render("new.slang")
  end

  def create
    bird = Bird.new(bird_params.validate!)

    if bird.valid? && bird.save
      flash["success"] = "Created Bird successfully."
      redirect_to "/birds"
    else
      flash["danger"] = "Could not create Bird!"
      render("new.slang")
    end
  end

  def edit
    if bird = Bird.find params["id"]
      render("edit.slang")
    else
      flash["warning"] = "Bird with ID #{params["id"]} Not Found"
      redirect_to "/birds"
    end
  end

  def update
    if bird = Bird.find(params["id"])
      bird.set_attributes(bird_params.validate!)
      if bird.valid? && bird.save
        flash["success"] = "Updated Bird successfully."
        redirect_to "/birds"
      else
        flash["danger"] = "Could not update Bird!"
        render("edit.slang")
      end
    else
      flash["warning"] = "Bird with ID #{params["id"]} Not Found"
      redirect_to "/birds"
    end
  end

  def destroy
    if bird = Bird.find params["id"]
      bird.destroy
    else
      flash["warning"] = "Bird with ID #{params["id"]} Not Found"
    end
    redirect_to "/birds"
  end

  def bird_params
    params.validation do
      required(:name) { |f| !f.nil? }
      required(:age) { |f| !f.nil? }
    end
  end
end
