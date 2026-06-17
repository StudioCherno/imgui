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
)

target_include_directories(ImGui PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_compile_features(ImGui PUBLIC cxx_std_20)

target_compile_definitions(ImGui PUBLIC IMGUI_USE_WCHAR32)
target_compile_definitions(ImGui PUBLIC
    $<$<CONFIG:Dist>:NDEBUG IMGUI_DISABLE_DEMO_WINDOWS IMGUI_DISABLE_DEBUG_TOOLS>
)
