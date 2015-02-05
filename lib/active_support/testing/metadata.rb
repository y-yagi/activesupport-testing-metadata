require "active_support"
require "active_support/test_case"

module ActiveSupport
  module Testing
    module Metadata
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def test(name, *metadata, &block)
          super(name, &block)
          test_name = "test_#{name.gsub(/\s+/,'_')}".to_sym
          self.metadata[test_name.to_s] = compute_metadata(metadata)
        end

        def compute_metadata(metadata)
          meta = if metadata[-1].is_a?(Hash)
                   metadata.pop
                 else
                   {}
                 end
          metadata.each { |key| meta[key] = true }
          meta
        end

        def metadata
          @metadata ||= Hash.new({})
        end
      end

      def metadata
        self.class.metadata[name] || {}
      end
    end
  end
end

ActiveSupport::TestCase.include(ActiveSupport::Testing::Metadata)
