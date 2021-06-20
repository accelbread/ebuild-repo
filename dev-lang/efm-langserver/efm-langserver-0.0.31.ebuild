# Copyright 2019-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="General purpose Language Server"
HOMEPAGE="https://github.com/mattn/efm-langserver"

EGO_SUM=(
	"github.com/gorilla/websocket v1.4.1"
	"github.com/gorilla/websocket v1.4.1/go.mod"
	"github.com/haya14busa/go-checkstyle v0.0.0-20170303121022-5e9d09f51fa1/go.mod"
	"github.com/kr/pretty v0.1.0"
	"github.com/kr/pretty v0.1.0/go.mod"
	"github.com/kr/pty v1.1.1/go.mod"
	"github.com/kr/text v0.1.0"
	"github.com/kr/text v0.1.0/go.mod"
	"github.com/mattn/go-unicodeclass v0.0.1"
	"github.com/mattn/go-unicodeclass v0.0.1/go.mod"
	"github.com/reviewdog/errorformat v0.0.0-20200502163639-f5b5a3cb8aed"
	"github.com/reviewdog/errorformat v0.0.0-20200502163639-f5b5a3cb8aed/go.mod"
	"github.com/sourcegraph/jsonrpc2 v0.0.0-20191222043438-96c4efab7ee2"
	"github.com/sourcegraph/jsonrpc2 v0.0.0-20191222043438-96c4efab7ee2/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15"
	"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200121175148-a6ecf24a6d71"
	"gopkg.in/yaml.v3 v3.0.0-20200121175148-a6ecf24a6d71/go.mod"
)

go-module_set_globals

SRC_URI="
	https://github.com/mattn/efm-langserver/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}
"

LICENSE="MIT BSD-with-disclosure"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_compile() {
	go build -o ${PN} || die
}

src_install() {
	dobin ${PN}
}
