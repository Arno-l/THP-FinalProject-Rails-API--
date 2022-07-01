require 'faker'

class User < ApplicationRecord
	
	devise :database_authenticatable, :registerable,
	:jwt_authenticatable,
	jwt_revocation_strategy: JwtDenylist

	def sendPassword
		
	end
end