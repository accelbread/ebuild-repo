# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Open-source keyboard firmware for Atmel AVR and Arm USB families"
HOMEPAGE="https://github.com/qmk/qmk_firmware"
SRC_URI=""

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	app-arch/unzip
	app-arch/zip
	app-mobilephone/dfu-util
	dev-embedded/avrdude
	dev-embedded/dfu-programmer
	dev-python/appdirs
	dev-python/argcomplete
	dev-python/colorama
	dev-python/hjson
	dev-python/milc
	dev-python/pygments
	net-misc/wget
	sys-devel/clang
	sys-devel/crossdev
"
