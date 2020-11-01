namespace :sessions do
  desc "Clears old sessions"
  task clean: :environment do
    ActiveRecord::SessionStore::Session.where("updated_at < ?", 1.day.ago).delete_all
  end
end
