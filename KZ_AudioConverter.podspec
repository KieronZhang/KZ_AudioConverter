
Pod::Spec.new do |s|

	s.name = 'KZ_AudioConverter'
	s.version = '0.1'
	s.summary = 'iOS amr wav convert.'
	s.homepage = 'https://github.com/KieronZhang/KZ_AudioConverter'
	s.license = {:type => 'MIT', :file => 'LICENSE'}
	s.author = {'KieronZhang.' => 'https://github.com/KieronZhang'}
	s.platform = :ios, '8.0'
	s.source = {:git => 'https://github.com/KieronZhang/KZ_AudioConverter.git', :tag => s.version, :submodules => true}
    s.xcconfig = {'OTHER_LDFLAGS' => '-ObjC'}
    s.frameworks = 'Foundation'
    s.vendored_frameworks = 'KZ_AudioConverter/KZ_AudioConverterFramework.framework'
    s.library = 'stdc++'
    s.pod_target_xcconfig = {'ENABLE_BITCODE' => 'NO'}
	s.requires_arc = true

end
