project "GLFW"
	kind "StaticLib"
	language "C"
	
	targetdir ("../../../bin/" .. outputdir .. "/%{prj.name}")
	objdir ("../../../bin-int/" .. outputdir .. "/%{prj.name}")

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
	
	defines "_GLFW_VULKAN_STATIC"

	systemversion "latest"
	
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
		
		

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
		inlining "auto"

	filter "configurations:Release"
		runtime "Release"
		optimize "speed"
		inlining "auto"


	filter "configurations:Dist"
		runtime "Release"
		optimize "speed"
		inlining "auto"


