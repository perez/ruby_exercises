require 'yaml'

module Serializable
  def serialize
    save = self.to_yaml

    File.open('save.yaml', 'w') { |file| file.write save }
  end

  def deserialize(file)
      save = YAML.load_file(file)

      File.delete(file)
      
      save
  end
end
