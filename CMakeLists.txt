add_library(ImGui STATIC
    imconfig.h
    imgui.h
    imgui.cpp
    imgui_draw.cpp
    imgui_internal.h
    imgui_tables.cpp
    imgui_widgets.cpp
    imgui_demo.cpp
    imstb_rectpack.h
    imstb_textedit.h
    imstb_truetype.h

    # ImPlot lives in this fork (added on the SimpleUX/Wayland lineage); compiled
    # into ImGui to match the premake source split. implot_demo.cpp is excluded.
    implot/implot.cpp
    implot/implot_items.cpp
)

# Bare <imgui.h> / "imgui.h" and implot's relative "implot.h". The <imgui/...>
# style used across the engine is a vendor-layout convention and is exposed by
# Hazel/vendor/CMakeLists.txt, not assumed by this fork.
target_include_directories(ImGui SYSTEM PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_compile_features(ImGui PUBLIC cxx_std_20)

target_compile_definitions(ImGui PUBLIC IMGUI_USE_WCHAR32)
target_compile_definitions(ImGui PUBLIC
    $<$<CONFIG:Dist>:NDEBUG IMGUI_DISABLE_DEMO_WINDOWS IMGUI_DISABLE_DEBUG_TOOLS>
)

set_target_properties(ImGui PROPERTIES POSITION_INDEPENDENT_CODE ON FOLDER "Dependencies")
