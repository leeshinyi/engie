module CustomFinder
  extend ActiveSupport::Concern

  def find_every(*args)
    keys = args.first.keys
    vals = args.first.values

    if keys.map(&:to_s).all? { |e| column_names.include?(e) }
      where(*args)
    else
      ExtendedAttribute.where(field: keys, value: vals).compact.map(&:extendable)
    end
  end
end
