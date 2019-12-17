# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{5,6,7,8} )

inherit distutils-r1

DESCRIPTION="A Python 2 and 3 asynchronous JSON RPC server"
HOMEPAGE="https://pypi.python.org/pypi/${PN} https://github.com/palantir/${PN}"
SRC_URI="https://github.com/palantir/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"
RDEPEND="
	dev-python/ujson[${PYTHON_USEDEP}]
"
PATCHES=( "${FILESDIR}/${P}-remove-future.patch"  )

python_prepare_all() {
	sed -i "s/0+unknown/${PV}/" versioneer.py
	distutils-r1_python_prepare_all
}
