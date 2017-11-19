module Ragnarok
  class MedallionsController < ApplicationController
    def index
      @medallions = Medallion.all
    end
  end
end

