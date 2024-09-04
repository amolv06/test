#!/usr/bin/env bash

export siteName="BigEatie"

echo "Building new site: $siteName"
hugo new site "../$siteName"
echo "Removing initial toml config"
rm -v "../$siteName/hugo.toml"
echo "Copying over my toml config"
cp -v hugo.toml "../$siteName/"
echo "Creating content-org folder"
mkdir ../"$siteName"/content-org
echo "Copying files into content-org"
cp -rv ../posts/* ../"$siteName"/content-org
echo "Exporting theme"
cp -rv hugo-xmin ../"$siteName"/themes
echo "Copying over images"
cp -rv images/ "../$siteName/static"
echo "Exporting to md"
emacs -Q --script build.el
echo "Building site"
cd "../$siteName"
hugo
echo "Copying over CNAME"
cp -v ../assets/CNAME ./public
