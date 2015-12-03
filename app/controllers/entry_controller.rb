class EntryController < ApplicationController
  def index
    @entries = Entry.get_all_entries
  end

  def detail
    @entry = Entry.get_entry_by_id params['id']
  end
end
