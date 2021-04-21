# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'
use_frameworks!
workspace 'RxSwiftStudy_Basic.xcworkspace'

def core_pods
    pod 'RxSwift'
    pod 'RxCocoa'
end

def network_pods
    pod 'Alamofire'
end

def common_pods
    pod 'Kingfisher'
end

def main_pods
    core_pods
    network_pods
    common_pods
end

target 'RxSwiftStudy_Basic_7th' do
    project 'RxSwiftStudy_Basic_7th/RxSwiftStudy_Basic_7th.project'
    core_pods
    common_pods
end

target 'RxSwiftStudy_Basic' do
    main_pods
    project './RxSwiftStudy_Basic.project'
end
