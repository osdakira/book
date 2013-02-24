# -*- coding: utf-8 -*-
module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    attr_accessor :headers, :csv_contents
    def initialize
      read
    end
  end
end

class RubyCsv # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv

  def each
    @csv_contents.each do |row|
      yield CsvRow.new(@headers, row)
    end
  end
end

class CsvRow
  def initialize(headers, row)
    @headers = headers
    @row = row
  end

  def method_missing name
    name = name.to_s
    return "" unless @headers.include? name
    idx = @headers.index name
    @row[idx]
  end

end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

# each メソッドが CsvRow オブジェクトを返すように,CSV アプリケーションを変更せ よ.その CsvRow の method_missing を使って,与えられた見出しの列の値を返すよう にせよ.
csv = RubyCsv.new
csv.each {|row| puts row.one}
