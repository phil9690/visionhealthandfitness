class ClassesController < ApplicationController

  def index
  end

  def show
    @class = params[:class]
    
    unless allowed_classes.detect { |allowed_class| @class == allowed_class }
      redirect_to action: 'index'
    end
  end

  def allowed_classes
    [ 
      'boxing',
      'hiit'
    ]
  end

end
