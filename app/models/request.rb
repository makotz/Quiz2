class Request < ActiveRecord::Base

  validates(:name, {presence: {message: "Don't forget name!"}})
  validates(:email, {presence: {message: "Must have email!"}})

  def self.search(search)
  search_condition = "%" + search + "%"
  where(['name ILIKE ? OR email ILIKE ? OR message ILIKE ? OR department ILIKE ?', search_condition, search_condition, search_condition, search_condition])
  end

  def self.complete(request)
    if request.completion == "Undone"
      Request.update(request, :completion => "Done")
    else
      Request.update(request, :completion => "Undone")
    end
  end

end
