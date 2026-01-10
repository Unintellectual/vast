#include "lib.hpp"

auto main() -> int
{
  auto const lib = library {};

  return lib.name == "vast" ? 0 : 1;
}
