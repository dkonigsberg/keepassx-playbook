message("See 'INSTALL' for configuration options.")
#message("*** Build Configuration:")
TEMPLATE = subdirs
isEmpty(PREFIX){
	PREFIX = /usr
}
#isEmpty(KDEDIR){
#	KDEDIR = /usr
#}
SUBDIRS += src
#contains(INT_PLUGINS,kde) {
#	SUBDIRS +=src/plugins/kde
#	message("Build KDE Plugin: yes")
#}
#!contains(INT_PLUGINS,kde) {
#	message("Build KDE Plugin: no")
#}
#contains(INT_PLUGINS,gtk) {
#	SUBDIRS +=src/plugins/gnome
#	message("Build Gnome Plugin: yes")
#}
#!contains(INT_PLUGINS,gtk) {
#	message("Build Gnome Plugin: no")
#}
message("Install Prefix:" $$PREFIX)
#message("KDE Prefix:" $$KDEDIR)
message("*** Makefile successfully generated.")
message("*** Start make now.")

package.target = keepassx.bar
package.depends = bin/keepassx
package.commands = find share/ -type f > .share.list && \
    blackberry-nativepackager \
    -devMode -debugToken ~/debugToken.bar \
    -package keepassx.bar -arg -platform -arg PlayBook \
    blackberry-tablet.xml \
    -e bin/keepassx keepassx \
    -e $$[QT_INSTALL_LIBS]/libQtCore.so.4 lib/libQtCore.so.4 \
    -e $$[QT_INSTALL_LIBS]/libQtGui.so.4 lib/libQtGui.so.4 \
    -e $$[QT_INSTALL_LIBS]/libQtOpenGL.so.4 lib/libQtOpenGL.so.4 \
    -e $$[QT_INSTALL_LIBS]/libQtNetwork.so.4 lib/libQtNetwork.so.4 \
    -e $$[QT_INSTALL_LIBS]/libQtXml.so.4 lib/libQtXml.so.4 \
    -e $$[QT_INSTALL_LIBS]/libplaybooksupport.so.1 lib/libplaybooksupport.so.1 \
    -e $$[QT_INSTALL_PLUGINS]/platforms/libqplaybook.so lib/platforms/libqplaybook.so \
    @.share.list && \
    rm .share.list

QMAKE_EXTRA_TARGETS += package
