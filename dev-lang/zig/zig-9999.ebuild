# Copyright 2019-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake llvm

DESCRIPTION="A robust, optimal, and maintainable programming language"
HOMEPAGE="https://ziglang.org/"
LICENSE="MIT"
SLOT="0"
IUSE="test"
RESTRICT="!test? ( test )"

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://github.com/ziglang/zig.git"
	inherit git-r3
else
	SRC_URI="https://github.com/ziglang/zig/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

BUILD_DIR="${S}/build"

# According to zig's author, zig builds that do not support all targets are not
# supported by the upstream project.
ALL_LLVM_TARGETS=(
	AArch64 AMDGPU ARM AVR BPF Hexagon Lanai Mips MSP430 NVPTX
	PowerPC RISCV Sparc SystemZ WebAssembly X86 XCore
)
ALL_LLVM_TARGETS=( "${ALL_LLVM_TARGETS[@]/#/llvm_targets_}" )

LLVM_MAX_SLOT=13

IUSE="${IUSE} ${ALL_LLVM_TARGETS[*]}"

RDEPEND="
	sys-devel/clang:${LLVM_MAX_SLOT}
	>=sys-devel/lld-12.0.0
	<sys-devel/lld-14.0.0
	sys-devel/llvm:${LLVM_MAX_SLOT}
"
DEPEND="${RDEPEND}"

llvm_check_deps() {
	has_version "sys-devel/clang:${LLVM_SLOT}"
}

src_configure() {
	for u in "${ALL_LLVM_TARGETS[@]}" ; do
		if ! use $u ; then
			sed -i '/LLVMInitialize'${u/#llvm_targets_/}'/d' src/codegen/llvm/bindings.zig
			sed -i '/LLVMInitialize'${u/#llvm_targets_/}'/d' src/codegen/llvm.zig
		fi
	done
	local mycmakeargs=(
		-DZIG_USE_CCACHE=OFF
		-DZIG_PREFER_CLANG_CPP_DYLIB=ON
	)
	cmake_src_configure
}

src_test() {
	cd "${BUILD_DIR}" || die
	./zig build test || die
}
