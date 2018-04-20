# Copyright 2017 Google Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

require 'google/storage/property/array'
module Google
  module Storage
    module Data
      # A class to manage data for cors for bucket.
      class BucketCors
        include Comparable

        attr_reader :max_age_seconds
        attr_reader :method
        attr_reader :origin
        attr_reader :response_header

        def to_json(_arg = nil)
          {
            'maxAgeSeconds' => max_age_seconds,
            'method' => method,
            'origin' => origin,
            'responseHeader' => response_header
          }.reject { |_k, v| v.nil? }.to_json
        end

        def to_s
          {
            max_age_seconds: max_age_seconds.to_s,
            method: method.to_s,
            origin: origin.to_s,
            response_header: response_header.to_s
          }.map { |k, v| "#{k}: #{v}" }.join(', ')
        end

        def ==(other)
          return false unless other.is_a? BucketCors
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            return false if compare[:self] != compare[:other]
          end
          true
        end

        def <=>(other)
          return false unless other.is_a? BucketCors
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            result = compare[:self] <=> compare[:other]
            return result unless result.zero?
          end
          0
        end

        def inspect
          to_json
        end

        private

        def compare_fields(other)
          [
            { self: max_age_seconds, other: other.max_age_seconds },
            { self: method, other: other.method },
            { self: origin, other: other.origin },
            { self: response_header, other: other.response_header }
          ]
        end
      end

      # Manages a BucketCors nested object
      # Data is coming from the GCP API
      class BucketCorsApi < BucketCors
        def initialize(args)
          @max_age_seconds =
            Google::Storage::Property::Integer.api_parse(args['maxAgeSeconds'])
          @method =
            Google::Storage::Property::StringArray.api_parse(args['method'])
          @origin =
            Google::Storage::Property::StringArray.api_parse(args['origin'])
          @response_header = Google::Storage::Property::StringArray.api_parse(
            args['responseHeader']
          )
        end
      end

      # Manages a BucketCors nested object
      # Data is coming from the Chef catalog
      class BucketCorsCatalog < BucketCors
        def initialize(args)
          @max_age_seconds = Google::Storage::Property::Integer.catalog_parse(
            args[:max_age_seconds]
          )
          @method =
            Google::Storage::Property::StringArray.catalog_parse(args[:method])
          @origin =
            Google::Storage::Property::StringArray.catalog_parse(args[:origin])
          @response_header =
            Google::Storage::Property::StringArray.catalog_parse(
              args[:response_header]
            )
        end
      end
    end

    module Property
      # A class to manage input to cors for bucket.
      class BucketCors
        def self.coerce
          ->(x) { ::Google::Storage::Property::BucketCors.catalog_parse(x) }
        end

        # Used for parsing Chef catalog
        def self.catalog_parse(value)
          return if value.nil?
          return value if value.is_a? Data::BucketCors
          Data::BucketCorsCatalog.new(value)
        end

        # Used for parsing GCP API responses
        def self.api_parse(value)
          return if value.nil?
          return value if value.is_a? Data::BucketCors
          Data::BucketCorsApi.new(value)
        end
      end

      # A Chef property that holds an integer
      class BucketCorsArray < Google::Storage::Property::Array
        def self.coerce
          lambda do |x|
            ::Google::Storage::Property::BucketCorsArray.catalog_parse(x)
          end
        end

        # Used for parsing Chef catalog
        def self.catalog_parse(value)
          return if value.nil?
          return BucketCors.catalog_parse(value) \
            unless value.is_a?(::Array)
          value.map { |v| BucketCors.catalog_parse(v) }
        end

        # Used for parsing GCP API responses
        def self.api_parse(value)
          return if value.nil?
          return BucketCors.api_parse(value) \
            unless value.is_a?(::Array)
          value.map { |v| BucketCors.api_parse(v) }
        end
      end
    end
  end
end
