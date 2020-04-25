class AddSearchableColumnToChapters < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      ALTER TABLE chapters
      ADD COLUMN searchable tsvector GENERATED ALWAYS AS (
        setweight(to_tsvector('english', coalesce(title, '')), 'A') ||
        setweight(to_tsvector('english', coalesce(content,'')), 'B')
      ) STORED;
    SQL
  end

  def down
    remove_column :chapters, :searchable
  end
end
