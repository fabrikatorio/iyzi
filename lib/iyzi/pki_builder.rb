module Iyzi
  class PkiBuilder
    attr_accessor :params

    def initialize(params = {})
      @params = params
    end

    def request_string
      str = prepare_request_string
      "[#{str}]" unless str.empty?
    end

    def prepare_request_string
      params.collect { |a| convert_str(a[0], a[1]) }.join(',')
    end

    def add_price(key, value)
      add(key, value.to_f.round(2)) if value.to_f != 0
    end

    def add_array(key, value)
      add(key, "[#{value.join(', ')}]")
    end

    def add_date(key, value)
      add(key, parse_date(value).strftime('%Y-%m-%d %H:%M:%S'))
    end

    def add(key, value)
      params[key] = value.to_s unless value.to_s.empty?
    end

    def adder(attribute)
      type_cast_hash[attribute.to_sym] || type_cast_hash[:default]
    end

    def convert_str(key, value)
      "#{key}=#{value}"
    end

    def parse_date(value)
      value.is_a?(String) ? DateTime.parse(value) : value
    end
  end
end
