class DemoController < ApplicationController
 
 layout 'admin' 
 def index
    #render(:template => 'hello')  	//old style 
    #render('hello') //new style to use template
    #redirect_to(:action => 'other_hello')
  end
  
  def hello
   @array = [10,20,30,40,50]
   @id = params[:id].to_i
   @page = params[:page].to_i
  end

  def other_hello
    render(:text => 'hello everyone')    
  end	

  def javascript 

  end

  def text_helpers

  end

  def escape_output

  end
end
