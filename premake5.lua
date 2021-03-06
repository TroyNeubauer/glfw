project "GLFW"
	kind "StaticLib"
	language "C"
	systemversion "latest"
	
	targetdir (binLocationOverride.."bin/" .. outputdir .. "/%{prj.name}")
	objdir (binLocationOverride.."bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"src/context.c",
		"src/init.c",
		"src/input.c",
		"src/monitor.c",
		"src/vulkan.c",
		"src/window.c",
		"src/egl_context.c",
		"src/osmesa_context.c"
	}
	

	
	filter "system:windows"
		
		files
		{
			"src/win32_init.c",
			"src/win32_joystick.c",
			"src/win32_monitor.c",
			"src/win32_time.c",
			"src/win32_thread.c",
			"src/win32_window.c",
			"src/wgl_context.c",
		}

		defines
		{ 
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}
		
		
	filter "system:linux"
		
		files
		{
			"src/x11_init.c",
			"src/linux_joystick.c",
			"src/x11_monitor.c",
			"src/posix_time.c",
			"src/posix_thread.c",
			"src/x11_window.c",
			"src/glx_context.c",
			"src/xkb_unicode.c",
		}

		defines 
		{ 
			"_GLFW_X11",
		}

	filter "system:macosx"
		
		files
		{
			"src/cocoa_init.m",
			"src/cocoa_joystick.m",
			"src/cocoa_monitor.m",
			"src/cocoa_time.c",
			"src/posix_thread.c",
			"src/cocoa_window.m",
			"src/nsgl_context.m",
		}

		defines 
		{
			"_GLFW_COCOA",
		}
		

