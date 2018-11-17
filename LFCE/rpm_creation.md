RPM Creation
1. Download the source
2. create tar.gz file
3. yum install rpmdevtools -y
4.rpmdev-setuptree
5. cp *tar.gz to rpmbuild/SOURCES
6. cd rpmbuild/SPECS
7. rpmdev-newspec testscript.spec
8. Open myscript.spec -> update version, summary,
source0 is name of tar ball (full name with gz)
%install
after rm
install -d $RPM_BUILD_ROOT/opt/testscript
install -m 755 testscript.sh /opt/testscript/testscript.sh
update files section
9. rpmbuild -ba testscript.spec
