class UsersController < ApplicationController
	before_action :require_login , only: [:edit,:logout,:users_dashboard,:show]

	before_action :admin_require_login, only: [:admin_dashboard]
	def home
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		
		if @user.save
			flash[:success] = "successfully created and Login only if you got a confirmation mail "
	 	 	redirect_to  users_signin_path(@user)
		else 
	 	 render 'new'
	    end
	end

	def signin
		
	end

	def users_dashboard
  	end

	def login
		
		@user = Manager.find_by(status: 1,username: params[:username])&.authenticate(params[:password])

   		if @user
      # Log the user in and redirect to the user's show page.
      		session[:user_id] = @user.id
        	redirect_to  users_users_dashboard_path(@user)
    	else
      # Create an error message.
      		flash[:danger] = "Login Again,Incorrect credentials or You are not confirmed by the admin"
      		render 'signin'
    	end
	end

	def edit

		 @user = User.find(params[:id])

	end

	def update 
		@user = User.find(params[:id])

		if @user.update(user_params)
			flash[:success] = "successfully updated"

			redirect_to users_users_dashboard_path(@user)
	    else
		 	render 'edit'
		end
    end

	def admin

	end

	def admin_login

		@user = Admin.find_by(username: params[:username])&.authenticate(params[:password])

   		if @user
      # Log the user in and redirect to the user's show page.
      		session[:user_id] = @user.id
        	redirect_to  users_admin_dashboard_path(@user)
    	else
      # Create an error message.
      		flash[:danger] = "Incorrect Credentials"
      		render 'admin'
    	end

	end

	def admin_dashboard

		@managers = Manager.where(status: 0)


	end


	def accept

	    @managers = Manager.find(params[:id])
		@managers.update(status: 1)
		UserMailer.welcome_email(@managers).deliver_now
		flash[:success] = "Accepted"
		redirect_to users_admin_dashboard_path

		# redirect_to users_signin_path
	
	
	end
	def reject
	    @managers = Manager.find(params[:id])
		@managers.update(status: 2)
		@managers.destroy
		flash[:danger] = "Rejected"
		redirect_to users_admin_dashboard_path

		# redirect_to users_signin_path
	
	end

	 def logout
    	reset_session
    	redirect_to root_path
    end

    def show 
    	@managers = User.find(params[:id])
    end


	
	def index

		@user = User.all
	end

	private


	 	def user_params
	 		params.require(:manager).permit(:email,:username,:password,:type,:password_confirmation,:phone_number,:store_name,:type_of_store,:location,:street,:pincode,:status)

	 	end
end