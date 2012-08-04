module Nitron
module UI
  module DataBindingSupport
    def dealloc
      if @_bindings
        @_bindings = nil
      end

      if @_model
        @_model = nil
      end

      super
    end

    def model
      @_model
    end

    def model=(model)
      @_model = model

      DataBinder.shared.bind(model, view)
    end

    def viewDidLoad
      super

      perform_bind
    end

    # When mixed into a view, allows you to refresh it when
    # an value is suspected to have changed. For e.g.:
    #
    #    class YourView < Nitron::ViewController
    #     def prepareForSegue(segue, sender:sender)
    #       segue.destinationViewController.delegate = self
    #     end
    #    end
    #
    #    class ViewYouAreSeguingTo
    #      attr_accessor :delegate
    #
    #      on :save do
    #        # Stuff preparing for save
    # 
    #        model.save!
    # 
    #        delegate.refresh if delegate.respond_to?(:refresh)
    #        close
    #      end
    #    end
    #
    # because +refresh+ is a method on data-bound views,
    # simply setting the delegate in your "parent" view
    # allow you to call refresh through the delegate from
    # the child.
    
    def refresh
      perform_bind
    end
    
    protected
    def perform_bind
      @_bindings = DataBinder.shared.bind(model, view)
    end
  end
end
end
