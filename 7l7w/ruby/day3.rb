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
    attr_accessor :headers, :csv_contents

    def initialize
      read
    end

    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
      file.each do |row|
        @csv_contents << CsvRow.new(@headers, row.chomp.split(', '))
      end
    end

    def each(&block)
      @csv_contents.each { |row| yield row }
    end

    class CsvRow
      def initialize(headers, row)
        @headers = headers
        @row = row
      end

      def method_missing(name, *args, &block)
        position = @headers.index(name.to_s)
        @row[position] if position
      end
    end

  end
end

class RubyCsv # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
m.each { |x| puts x.one }
