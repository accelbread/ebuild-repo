# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8} )

inherit distutils-r1

DESCRIPTION="Isort plugin for python-language-server"
HOMEPAGE="https://pypi.org/project/pyls-isort/ https://github.com/paradoxxxzero/pyls-isort"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"
RDEPEND="
	dev-python/isort[${PYTHON_USEDEP}]
	dev-python/python-language-server[${PYTHON_USEDEP}]
"
