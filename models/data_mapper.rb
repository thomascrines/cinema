class DataMapper

  def self.data_to_objects(object_class, data)
    return data.map { |object_data| object_class.new(object_data) }
  end

  def self.data_to_object(object_class, data)
    return self.data_to_objects(object_class, data).first
  end
end