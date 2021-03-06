# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DISTUTILS_USE_SETUPTOOLS=no
PYTHON_COMPAT=( python{2_7,3_{6,7}} )

inherit distutils-r1

DESCRIPTION="Alternative Python bindings for Subversion"
HOMEPAGE="https://jelmer.uk/code/subvertpy/ https://pypi.org/project/subvertpy"
SRC_URI="mirror://pypi/${PN::1}/${PN}/${P}.tar.gz"

LICENSE="|| ( LGPL-2.1 LGPL-3 )"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND=">=dev-vcs/subversion-1.4"
DEPEND="${RDEPEND}
	dev-libs/apr-util"

python_compile() {
	python_is_python3 || local -x CFLAGS="${CFLAGS} -fno-strict-aliasing"
	distutils-r1_python_compile
}

python_test() {
	esetup.py test --args=-v
}
