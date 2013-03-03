module SessionsHelper

  def current_user
    @current_user ||= user_from_remember_token  #si @current_user pas défini, appel la méthode user_from.. , sinon return @current_user
  end

  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]		# .permanent : 20.years.from_now, .signed : sécurise le cookie -> user_id jamais accessible ds le nav
    self.current_user = user  #variable current_user sera accessible partout. 
  end

  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  def authenticate
    deny_access unless signed_in?     #code unless condition  -> execute le code si condition == false
  end

  def current_user=(user)	#méthode d'assignement 
  	@current_user = user
  end

  def signed_in?
    !current_user.nil?  #return true si current_user est !=null
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  def deny_access
    store_location
    flash[:notice] = "Connectez-vous pour avoir acces a cette section"
    redirect_to signin_path
    #redirect_to signin_path, :notice "Connectez-vous pour avoir accès à cette section"
  end

  def current_user?(user)
    current_user == user
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  private 

  	def user_from_remember_token
  	  User.authenticate_with_salt(*remember_token)		# somme(5, 3)  == somme(*[5, 3])
    end

    def remember_token 									#retourne [integer, string]
      cookies.signed[:remember_token] || [nil, nil] #retourne [user.id, user.salt] si défini sinon [nil, nil]
    end

    def store_location 
      session[:return_to] = request.fullpath
    end

    def clear_return_to
      session[:return_to] = nil
    end
end
