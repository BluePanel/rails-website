class CreateTranslationForProjects < ActiveRecord::Migration
  def up
		I18n.locale = :en
    Project.create_translation_table!({description: :text}, {migrate_data: true})
		I18n.locale = :de
		Project.all.each do |project|
			project.description = project.description_de
			project.save
    end
		remove_column :projects, :description_de, :text
		remove_column :projects, :description, :text
  end

  def down
    add_column :projects, :description_de, :text
		I18n.locale = :de
		Project.all.each do |project|
			project.description_de = project.description 
			project.save
    end
		I18n.locale = :en
    Project.drop_translation_table! migrate_data: true
  end
end
