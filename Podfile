# Uncomment the next line to define a global platform for your project
platform :ios, '13.5'

def shared_pods
  pod 'Firebase/Core'
  pod 'Firebase/Auth'
  pod 'Firebase/Storage'
  pod 'Firebase/Firestore'
  pod 'Firebase/Functions'
  pod 'IQKeyboardManagerSwift'
  pod 'Kingfisher', '~> 5.0'
  pod 'CodableFirebase'
end

target 'Artable' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Artable
  shared_pods
  pod 'Stripe'
  pod 'Alamofire'

end

target 'ArtableAdmin' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ArtableAdmin
  shared_pods
  pod 'CropViewController'

end
