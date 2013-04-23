########################################
#                                      #
#       Important Note                 #
#                                      #
#   When running calabash-ios tests at #
#   www.xamarin.com/test-cloud         #
#   this file will be overwritten by   #
#   a file which automates             #
#   app launch on devices.             #
#                                      #
#   Don't rely on this file being      #
#   present when running at            #
#   Xamarin Test Cloud                 #
#                                      #
########################################

require 'calabash-cucumber/launcher'


# APP_BUNDLE_PATH = "~/Library/Developer/Xcode/DerivedData/??/Build/Products/Calabash-iphonesimulator/??.app"
# You may uncomment the above to overwrite the APP_BUNDLE_PATH
# However the recommended approach is to let Calabash find the app itself
# or set the environment variable APP_BUNDLE_PATH


Before do |scenario|
  @calabash_launcher = Calabash::Cucumber::Launcher.new
  @calabash_launcher.relaunch
  @calabash_launcher.calabash_notify(self)
end

After do |scenario|
  unless @calabash_launcher.calabash_no_stop?
    if @calabash_launcher.active?
      @calabash_launcher.stop
    else
      Calabash::Cucumber::SimulatorHelper.stop
    end
  end
end