require "./spec_helper"
require "../../src/models/bird.cr"

describe Bird do
  Spec.before_each do
    Bird.clear
  end
end
