# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'edugram' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for edugram

  target 'edugramTests' do
    inherit! :search_paths
    # Pods for testing
  end
	
  pod 'Firebase/Analytics'
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'
  pod 'Firebase/Storage'
  pod 'Firebase/Database'
  
  platform :ios, '9.0'
  pod 'SDWebImage', '~> 5.0'

  post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
   end
  end

  target 'edugramUITests' do
    # Pods for testing
  end


end
