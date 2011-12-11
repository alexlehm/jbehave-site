
VERSION=$1
QUALIFIER=$2

if [ "$VERSION" == "" ] || [ "$QUALIFIER" == "" ]; then
  echo "usage: upload-reference.sh <version> <qualifier>"
  exit;
fi

ARTIFACT="jbehave-site-$VERSION"
REFERENCE="/var/www/jbehave.org/reference/site"

VERSIONED="$REFERENCE/$VERSION"

scp target/$ARTIFACT-bin.zip jbehave.org:
ssh jbehave.org "rm -r $ARTIFACT; unzip -q $ARTIFACT-bin.zip; rm -r $VERSIONED; mv $ARTIFACT/docs/ $VERSIONED; cd $REFERENCE; rm $QUALIFIER; ln -s $VERSION $QUALIFIER"
