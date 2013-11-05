#!/bin/sh
# vim: set et sw=2 ts=2 tw=0:
#
# adddepinfo.sh
#
# This script adds support for dependencies on Slackware
# repositories. It creates a "ghost" repository that only holds
# the dependency info and diverts all traffic to a real Slackware
# repository.
#
# You will need to have a directory with dependency files named
# "packagename.dep" for each package in the slackware repository. That
# file should include a comma separated list of dependencies.
#
# The script checks if there are any updated packages on the Slackware
# repository. If there are, the PACKAGES.TXT file is created again with
# dependency info from those .dep files.
#
# If you want to force the creation of a new PACKAGES.TXT file, even if
# there are no package updates in the Slackware repository, like if you
# update a .dep file, you can run the script with the "-f" switch.
#
# You can change the SLACKREPO variable to point the traffic to a
# different Slackware repository than the default one.
#
# If you want to allow the user to select another SLACKREPO, then
# run this script with the "-t" flag. You need to have a web server
# that can do mod_rewrite, .htaccess and php.
#
# Written by George Vlahavas <vlahavas~at~gmail~dot~com> for Salix
# Written by Cyrille Pontvieux <jrd~at~enialis~dot~net> for Salix
#
# Licensed under the GPLv3
#

# default slackware base repository, please don't write the ending /
#SLACKREPO="http://mirrors.nix.org.ua/linux/slackwarearm"
#SLACKREPO="http://ftp.arm.slackware.com/slackwarearm"
#SLACKREPO="http://arm" # gia test prin apo lftp sto repos
SLACKREPO="http://repos.os.cs.teiath.gr/pub/slackwarearm-current"
# space separated, starting and ending with a space
EXCLUDE=' arts k3b3 kdelibs3 qca-tls1 qca1 qt3 tightvnc '

#
# Don't touch anything after this
#
cd "$(dirname "$0")"
BASE_DIR=$(basename "$PWD")
#SLACKREPO_FULL="$SLACKREPO/$BASE_DIR"
SLACKREPO_FULL="$SLACKREPO/"
DEPSDIR="$PWD/deps"

forced=
templated=
while [ -n "$1" ]; do
  case "$1" in
    -f)
      forced=1
      ;;
    -t)
      templated=1
      ;;
  esac
  shift
done

# $1 : Subdirectory
# $2 : Repository directory
update_packages_txt() {
  SUBDIR="$1"
  REPODIR="$2"
      echo -n "Adding txt info to txt, this may take a while"
      SLACKREPO_PLACEHOLDER="$SLACKREPO_FULL/"
    for i in $(grep 'PACKAGE NAME:  .*t[gx]z$' .PACKAGES.TXT.ellak | sed 's/PACKAGE NAME:  //'); do
      echo -n "."

      # make files PKG.txt gia perigrafi >>>
      PKGNAME=$(echo $i | sed 's/\(.*\)-\(.*\)-\(.*\)-\(.*\).t[gx]z/\1/')
      PKGNAMEtxt=$(awk /$PKGNAME:/ .PACKAGES.TXT.ellak)
      echo  $PKGNAMEtxt > $PKGNAME.txt
          # Add an extra empty line before every entry, just in case
      sed -i "s/$PKGNAME:/\n$PKGNAME:/g" $PKGNAME.txt
      sed -i "s/$PKGNAME://g" $PKGNAME.txt
      # make files PKG.txt gia perigrafi <<<

      #xml >>>
      product_desc=$(echo $PKGNAMEtxt | sed  "s/$PKGNAME:/<br>/g") 	# product desc
      file_url=$(cat $PKGNAME.img ) 					# product images
      . xml.sh $PKGNAME							# run protypo
      #xml <<<

      # files pou den echoun el desc
      [ -f $PKGNAME.txt.el ] || echo $PKGNAME >> 0no.el.pkg
    done
    rm -f .PACKAGES.TXT.ellak
    echo ""
}

update_packages_txt '' ''
[ -d txt ] || mkdir txt
(
  cd txt
  cp -f ../PACKAGES.TXT .PACKAGES.TXT.ellak
  rm -f 0no.el.pk*
  update_packages_txt 'txt' ''
  PKGEL=$(wc -l 0no.el.pkg)
  echo $PKGEL >  0no.el.pkg-nr
)
