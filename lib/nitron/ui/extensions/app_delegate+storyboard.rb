class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    if storyboard
      @window.rootViewController = storyboard.instantiateInitialViewController
    end

    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible

    true
  end

  # Override AppDelegate#storyboard to substitute your own storyboard name,
  # particularly in the case where you have a different one for
  # the iPhone or the iPad.
  def storyboard
    @storyboard ||= UIStoryboard.storyboardWithName("MainStoryboard", bundle:nil)
  end
end

