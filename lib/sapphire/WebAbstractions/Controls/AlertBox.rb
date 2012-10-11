module Sapphire
  module WebAbstractions
    class AlertBox < Control
      def Accept
        $driver.AcceptAlert
      end

      def Set(text)
        $driver.SetAlert(text)
      end

      def Visible(shouldWait = true, comparator = nil)
        return Evaluation.new(comparator.Compare($driver.AlertShown(), true), true) if !comparator.nil?
        Evaluation.new($driver.AlertShown(), true)
      end

      def Find(comparator = nil)
        return $driver.FindAlert
      end
    end
  end
end