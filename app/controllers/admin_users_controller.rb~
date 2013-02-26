class AdminUsersController < ApplicationController
  
  layout 'admin'
  
  before_filter :confirm_logged_in  

  def index
    list
    render('list')
  end   
 
  def list
     @users = User.sorted
  end

  def new
     @users = User.new
  end

  def edit
     @users = User.find(params[:id])
  end

  def delete
     @users = User.find(params[:id])
  end

  def create
       @users = User.new(params[:user])
    if @users.save
      flash[:notice] = "Admin user created."
      redirect_to(:action => 'list')
   else
     # @users_count = Subject.count + 1
      render('new')
   end 
  end

  
  def update
    @users = User.find(params[:id])
   if @users.update_attributes(params[:user])
      flash[:notice] = "User updated."
      redirect_to(:action => 'list')
   else
     # @subject_count = Subject.count
      render('edit')
   end  
  end
  

  def destroy
   User.find(params[:id]).destroy
   flash[:notice] = "User destroyed."
   redirect_to(:action => 'list') 
  end



end
