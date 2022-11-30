module CustomFinder
  extend ActiveSupport::Concern

  def find_every(*args)
    keys = args.first.keys
    vals = args.first.values

    if keys.count == 1 && !column_names.include?(keys.first)
      left_joins(:extended_attributes).where(extended_attributes: { field: keys.first, value: vals.first })
    else
      return nil unless keys.map(&:to_s).all? { |e| column_names.include?(e) }

      where(*args)
    end
  end
end
