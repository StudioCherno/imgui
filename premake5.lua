project "ImGui"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
    staticruntime "off"
    systemversion "latest"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"imconfig.h",
		"imgui.h",
		"imgui.cpp",
		"imgui_draw.cpp",
		"imgui_internal.h",
		"imgui_tables.cpp",
		"imgui_widgets.cpp",
		"imstb_rectpack.h",
		"imstb_textedit.h",
		"imstb_truetype.h",
		"imgui_demo.cpp",

		-- ImPlot submodule
		"implot/implot.h",
		"implot/implot.cpp",
		"implot/implot_internal.h",
		"implot/implot_items.cpp",
	}
	
	defines
	{
        "IMGUI_USE_WCHAR32"
	}

    includedirs
    {
        -- Back to vendor dir for Hazel, which uses imgui/imgui.h include paths
        "../"
    }

	filter "system:linux"
		pic "On"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

    filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"
		defines
		{
			"NDEBUG",
			"IMGUI_DISABLE_DEMO_WINDOWS",
			"IMGUI_DISABLE_DEBUG_TOOLS",
		}
