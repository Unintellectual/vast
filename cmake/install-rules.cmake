install(
    TARGETS vast_exe
    RUNTIME COMPONENT vast_Runtime
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
