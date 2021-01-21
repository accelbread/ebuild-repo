# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit meson

DESCRIPTION="A compositor for X, and a fork of compton"
HOMEPAGE="https://github.com/yshui/picom"
SRC_URI="https://github.com/yshui/picom/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( MPL-2.0 MIT )"
SLOT="0"
KEYWORDS="~amd64"
IUSE="dbus +drm opengl +pcre xinerama"
IUSE="+config +pcre drm +opengl dbus"

COMMON_DEPEND="
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libxcb
	x11-libs/xcb-util-renderutil
	x11-libs/xcb-util-image
	x11-libs/pixman
	dev-libs/libev
	dbus? ( sys-apps/dbus )
	config? (
		dev-libs/libconfig
	)
	opengl? ( virtual/opengl )
	pcre? ( dev-libs/libpcre:3 )
	drm? ( x11-libs/libdrm )"
RDEPEND="${COMMON_DEPEND}
	x11-apps/xprop
	x11-apps/xwininfo"
DEPEND="${COMMON_DEPEND}
	dev-libs/uthash
	app-text/asciidoc
	x11-base/xorg-proto"

src_configure() {
	local emesonargs=(
		$(meson_use config config_file)
		$(meson_use pcre regex)
		$(meson_use drm vsync_drm)
		$(meson_use opengl)
		$(meson_use dbus)
		-Dwith_docs=true
	)
	meson_src_configure
}
