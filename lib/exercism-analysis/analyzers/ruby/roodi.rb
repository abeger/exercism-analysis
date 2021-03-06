require 'roodi'

class Exercism
  module Analyzers

    class Roodi < Analyzer

      def call
        roodi = ::Roodi::Core::Runner.new
        roodi.check_content(adapter.code)
        roodi.errors.map do |error|
          ThirdPartyResult.new(error.message, error.line_number)
        end
      end

    end

  end
end