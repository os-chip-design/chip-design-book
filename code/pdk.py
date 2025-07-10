import ciel
from ciel.source import StaticWebDataSource
from librelane.common import get_opdks_rev, ScopedFile

ciel.enable(
    ciel.get_ciel_home(),
    "sky130",
    get_opdks_rev(),
    data_source=StaticWebDataSource("https://fossi-foundation.github.io/ciel-releases"),
)
