json.array!(@projects) do |project|
  json.extract! project, :id, :name, :description, :description_de, :link
  json.url project_url(project, format: :json)
end
