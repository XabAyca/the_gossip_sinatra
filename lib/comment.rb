class Comment
  attr_accessor :id, :comment

  def initialize(id,comment)
    @id      = id
    @comment = comment
  end

  #création et sauvegarde du commentaire sur le csv
  def save
    CSV.open('./db/comment.csv', 'ab') {|csv| csv << [id,comment]}
  end

  #Recherche de tous les commentaires par ID pour renvoie sur la page show
  def self.find(id)
    comments = []
    CSV.read('./db/comment.csv').each do |csv_line|
      if csv_line[0].to_i == id.to_i
        comments << csv_line[1]
      end
    end
    return p comments
  end

end