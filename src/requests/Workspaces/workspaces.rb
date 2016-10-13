class Workspaces
  def self.workspaces_get(client)
    end_point = 'my/workspaces'
    code, body = client.get_request(end_point)
[code, body]
  end

  def self.workspaces_delete(client)
    end_point = 'my/workspaces/657689'
    code, body, workspace_id = client.delete_request(end_point)
    [code, body, workspace_id]
  end
end