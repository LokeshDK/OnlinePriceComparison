class ProductinfosImport
  include ActiveModel::Model
  require 'roo'

  attr_accessor :file

  def initialize(attributes={})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def load_imported_productinfos
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(3)
    (4..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      product = Productinfo.find_by_id(row["id"]) || Productinfo.new
      product.attributes = row.to_hash
      product
    end
  end

  def imported_productinfos
    @imported_productinfos ||= load_imported_productinfos
  end

  def save
    if imported_productinfos.map(&:valid?).all?
      imported_productinfos.each(&:save!)
      true
    else
      imported_productinfos.each_with_index do |item, index|
        item.errors.full_messages.each do |msg|
          errors.add :base, "Row #{index + 6}: #{msg}"
        end
      end
      false
    end
  end
end