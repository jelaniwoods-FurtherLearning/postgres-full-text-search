class Chapter < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_chapter,
                  against: { title: "A", content: "B" },
                  using: { 
                    tsearch: {
                      dictionary: "english",
                      tsvector_column: "searchable"
                    }
                  }
end
