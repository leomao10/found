# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_found_session',
  :secret      => '4a99d44947d0120aded6a164e024ab3c4076f2fb67a08bdbda0c378d1d691d21592964e9094d72ab3a8eb4e6b39d9f08c71caa550cca51af6f3d2328f5c4dbed'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
