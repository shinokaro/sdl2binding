module SDL2
  class Audio
    module CaptureStatus
      def input?
        capture
      end

      def output?
        !capture
      end
    end
  end
end