# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{5,6,7} )

inherit distutils-r1

DESCRIPTION="An implementation of the Language Server Protocol for Python"
HOMEPAGE="https://pypi.python.org/pypi/${PN} https://github.com/palantir/${PN}"
SRC_URI="https://github.com/palantir/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="autopep8 mccabe +pycodestyle pydocstyle +pyflakes pylint +rope +yapf"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="
	>=dev-python/jedi-0.14.1[${PYTHON_USEDEP}]
	>=dev-python/python-jsonrpc-server-0.3.2[${PYTHON_USEDEP}]
	dev-python/pluggy[${PYTHON_USEDEP}]
	dev-python/ujson[${PYTHON_USEDEP}]
	autopep8? ( dev-python/autopep8[${PYTHON_USEDEP}] )
	mccabe? ( dev-python/mccabe[${PYTHON_USEDEP}] )
	pycodestyle? ( dev-python/pycodestyle[${PYTHON_USEDEP}] )
	pydocstyle? ( dev-python/pydocstyle[${PYTHON_USEDEP}] )
	pyflakes? ( dev-python/pyflakes[${PYTHON_USEDEP}] )
	pylint? ( dev-python/pylint[${PYTHON_USEDEP}] )
	rope? ( dev-python/rope[${PYTHON_USEDEP}] )
	yapf? ( dev-python/yapf[${PYTHON_USEDEP}] )
"
