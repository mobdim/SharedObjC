Pod::Spec.new do |s|
  s.name         = 'SharedObjC'
  s.version      = '0.0.1'
  s.license      = 'MIT'
  s.homepage     = 'https://github.com/mobdim/SharedObjC'
  s.authors      = 'Dmitry Zadoroghniy' => 'dima@mobdim.com'
  s.summary      = 'Helpers funcs.'

# Source Info
#  s.platform     =  :ios, '7.0'
#  s.public_header_files = 'streamlib/lib/*.h'
#s.source       =  { :git => 'git@gitlab.mobdim.com:iphone/streamlib.git', :tag => "v#{s.version}" }
  s.source       =  { :git => 'git@github.com:mobdim/SharedObjC.git' }
#  s.source_files = 'streamlib/lib/*.{h,m}', 'streamlib/lib/*.mm', 'streamlib/lib/*.cpp'
#  s.framework    =  'CoreVideo', 'CoreMedia', 'CoreGraphics', 'AVFoundation', 'AudioToolbox', 'Foundation', 'UIKit'

  s.requires_arc = true

  s.subspec 'Extensions' do |ext|
      ext.source_files = 'Extensions/*.{h,mm}'
  end

  s.subspec 'Managers' do |man|
    man.source_files = 'Managers/*.{h,m}'
  end
  
  s.subspec 'Helpers' do |hel|
    hel.source_files = 'Helpers/*.{h,m}'
  end


# Pod Dependencies

end
