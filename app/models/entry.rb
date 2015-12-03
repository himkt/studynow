class Entry < ActiveRecord::Base
  def self.get_all_entries
    return Entry.all
  end

  def self.get_entry_by_id id
    return Entry.find(id)
  end
end
