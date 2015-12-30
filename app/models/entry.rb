class Entry < ActiveRecord::Base
  validates :user_id, presence: true
  validates :title,  length: { minimum: 1 }
  validates :author, presence: true

  def self.get_all_entries
    return Entry.all
  end

  def self.get_entry_by_id id
    return Entry.find(id)
  end
end
