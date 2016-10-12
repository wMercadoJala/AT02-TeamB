class GetStories
    def self.return_stories_reponse(client, id_proyect)
      end_point = '/projects' + id_proyect + '/' + stories
      code, body = client.post_request(end_point)
    end
end