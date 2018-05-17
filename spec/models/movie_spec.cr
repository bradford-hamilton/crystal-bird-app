require "./spec_helper"
require "../../src/models/movie.cr"

describe Movie do
  Spec.before_each do
    Movie.clear
  end
end
