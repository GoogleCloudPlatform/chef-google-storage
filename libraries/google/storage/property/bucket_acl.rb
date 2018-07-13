# Copyright 2018 Google Inc.
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
      # A class to manage data for Acl for bucket.
      class BucketAcl
        include Comparable

        attr_reader :bucket
        attr_reader :domain
        attr_reader :email
        attr_reader :entity
        attr_reader :entity_id
        attr_reader :id
        attr_reader :project_team
        attr_reader :role

        def to_json(_arg = nil)
          {
            'bucket' => bucket,
            'domain' => domain,
            'email' => email,
            'entity' => entity,
            'entityId' => entity_id,
            'id' => id,
            'projectTeam' => project_team,
            'role' => role
          }.reject { |_k, v| v.nil? }.to_json
        end

        def to_s
          {
            bucket: bucket.to_s,
            domain: domain.to_s,
            email: email.to_s,
            entity: entity.to_s,
            entity_id: entity_id.to_s,
            id: id.to_s,
            project_team: project_team.to_s,
            role: role.to_s
          }.map { |k, v| "#{k}: #{v}" }.join(', ')
        end

        def ==(other)
          return false unless other.is_a? BucketAcl
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            return false if compare[:self] != compare[:other]
          end
          true
        end

        def <=>(other)
          return false unless other.is_a? BucketAcl
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
            { self: bucket, other: other.bucket },
            { self: domain, other: other.domain },
            { self: email, other: other.email },
            { self: entity, other: other.entity },
            { self: entity_id, other: other.entity_id },
            { self: id, other: other.id },
            { self: project_team, other: other.project_team },
            { self: role, other: other.role }
          ]
        end
      end

      # Manages a BucketAcl nested object
      # Data is coming from the GCP API
      class BucketAclApi < BucketAcl
        def initialize(args)
          @bucket = Google::Storage::Property::BucketNameRef.api_parse(args['bucket'])
          @domain = Google::Storage::Property::String.api_parse(args['domain'])
          @email = Google::Storage::Property::String.api_parse(args['email'])
          @entity = Google::Storage::Property::String.api_parse(args['entity'])
          @entity_id = Google::Storage::Property::String.api_parse(args['entityId'])
          @id = Google::Storage::Property::String.api_parse(args['id'])
          @project_team =
            Google::Storage::Property::BucketProjectTeam.api_parse(args['projectTeam'])
          @role = Google::Storage::Property::Enum.api_parse(args['role'])
        end
      end

      # Manages a BucketAcl nested object
      # Data is coming from the Chef catalog
      class BucketAclCatalog < BucketAcl
        # rubocop:disable Metrics/MethodLength
        def initialize(args)
          @bucket = Google::Storage::Property::BucketNameRef.catalog_parse(args[:bucket])
          @domain = Google::Storage::Property::String.catalog_parse(args[:domain])
          @email = Google::Storage::Property::String.catalog_parse(args[:email])
          @entity = Google::Storage::Property::String.catalog_parse(args[:entity])
          @entity_id = Google::Storage::Property::String.catalog_parse(args[:entity_id])
          @id = Google::Storage::Property::String.catalog_parse(args[:id])
          @project_team =
            Google::Storage::Property::BucketProjectTeam.catalog_parse(args[:project_team])
          @role = Google::Storage::Property::Enum.catalog_parse(args[:role])
        end
        # rubocop:enable Metrics/MethodLength
      end
    end

    module Property
      # A class to manage input to Acl for bucket.
      class BucketAcl
        def self.coerce
          ->(x) { ::Google::Storage::Property::BucketAcl.catalog_parse(x) }
        end

        # Used for parsing Chef catalog
        def self.catalog_parse(value)
          return if value.nil?
          return value if value.is_a? Data::BucketAcl
          Data::BucketAclCatalog.new(value)
        end

        # Used for parsing GCP API responses
        def self.api_parse(value)
          return if value.nil?
          return value if value.is_a? Data::BucketAcl
          Data::BucketAclApi.new(value)
        end
      end

      # A Chef property that holds an integer
      class BucketAclArray < Google::Storage::Property::Array
        def self.coerce
          ->(x) { ::Google::Storage::Property::BucketAclArray.catalog_parse(x) }
        end

        # Used for parsing Chef catalog
        def self.catalog_parse(value)
          return if value.nil?
          return BucketAcl.catalog_parse(value) \
            unless value.is_a?(::Array)
          value.map { |v| BucketAcl.catalog_parse(v) }
        end

        # Used for parsing GCP API responses
        def self.api_parse(value)
          return if value.nil?
          return BucketAcl.api_parse(value) \
            unless value.is_a?(::Array)
          value.map { |v| BucketAcl.api_parse(v) }
        end
      end
    end
  end
end
