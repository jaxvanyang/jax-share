# This is an example of a PKGBUILD for splitting packages. Use this as a
# start to creating your own, and remove these comments. For more information,
# see 'man PKGBUILD'. NOTE: Please fill out the license field for your package!
# If it is unknown, then please put 'unknown'.

# Maintainer: Jax Young <jaxvanyang@gmail.com>
pkgname=('pkg1' 'pkg2')
pkgbase=BASE
pkgver=VERSION
pkgrel=1
epoch=
pkgdesc=""
arch=()
url=""
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgbase-$pkgver.tar.gz"
        "$pkgname-$pkgver.patch")
noextract=()
sha256sums=()
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgbase-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package_pkg1() {
	# options and directives that can be overridden
	pkgdesc=""
	arch=()
	url=""
	license=()
	groups=()
	depends=()
	optdepends=()
	provides=()
	conflicts=()
	replaces=()
	backup=()
	options=()
	install=
	changelog=

	cd "$pkgbase-$pkgver"
	make DESTDIR="$pkgdir/" install-pkg1
}

package_pkg2() {
	# options and directives overrides
	pkgdesc=""

	cd "$pkgbase-$pkgver"
	make DESTDIR="$pkgdir/" install-pkg2
}
