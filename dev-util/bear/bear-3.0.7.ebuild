# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Bear generates a compilation database for clang tooling"
HOMEPAGE="https://github.com/rizsotto/Bear"
SRC_URI="https://github.com/rizsotto/Bear/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	net-libs/grpc
	dev-libs/libfmt
	dev-libs/spdlog
	>=dev-cpp/nlohmann_json-3.7
	dev-db/sqlite
"
BDEPEND="
	${RDEPEND}
	virtual/pkgconfig
"

S="${WORKDIR}/${P^}"

src_configure() {
	local mycmakeargs=(
		-DENABLE_UNIT_TESTS=OFF
		-DENABLE_FUNC_TESTS=OFF
	)
	cmake_src_configure
}
