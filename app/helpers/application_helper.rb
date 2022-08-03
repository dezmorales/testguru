# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.zone.now.year
  end

  def github_url(_author, _repo)
    link_to 'TestGuru', 'https://github.com/#%7Bauthor%7D/#%7Brepo%7D', target: '_blank', rel: 'noopener'
  end
end
