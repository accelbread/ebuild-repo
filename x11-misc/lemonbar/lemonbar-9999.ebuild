# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="A featherweight, lemon-scented, bar based on xcb"
HOMEPAGE="https://github.com/LemonBoy/bar"
EGIT_REPO_URI="https://github.com/osense/bar.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="xft"

CDEPEND="
	x11-libs/libxcb
	xft? ( x11-libs/libXft )
"
DEPEND="
	dev-lang/perl
	${CDEPEND}
"
RDEPEND="
	${CDEPEND}
"
