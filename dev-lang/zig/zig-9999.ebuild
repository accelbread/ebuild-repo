# Copyright 2019-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake llvm

DESCRIPTION="A robust, optimal, and maintainable programming language"
HOMEPAGE="https://ziglang.org/"
LICENSE="MIT"
SLOT="0"

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://github.com/ziglang/zig.git"
	inherit git-r3
else
	SRC_URI="https://github.com/ziglang/zig/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

ALL_LLVM_TARGETS=(
	AArch64 AMDGPU ARM AVR BPF Hexagon Lanai Mips MSP430 NVPTX
	PowerPC RISCV Sparc SystemZ WebAssembly X86 XCore
)
ALL_LLVM_TARGETS=( "${ALL_LLVM_TARGETS[@]/#/llvm_targets_}" )

LLVM_MAX_SLOT=12

IUSE="${ALL_LLVM_TARGETS[*]}"

RDEPEND="
	sys-devel/clang:${LLVM_MAX_SLOT}
	sys-devel/lld
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
		fi
	done
	local mycmakeargs=(
		-DZIG_USE_CCACHE=OFF
		-DZIG_PREFER_CLANG_CPP_DYLIB=ON
	)
	cmake_src_configure
}
