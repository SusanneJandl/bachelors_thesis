#!/bin/zsh

echo "We create a local copy of the bib-generated file"

SRC="/Users/john/repos/cfp-bib/generated-bib-groups/thesis-ba-ma-bib.bib"
if [ -f "biblio.bib" ]; then
    now=$(date +"%Y-%m-%d--%H-%M-%s")
    mv -f biblio.bib biblio-$now.bak
fi

# OLD: cp "$SRC" "biblio.bib"
# NEW: ignore / remove the comments %%
cat "$SRC" | grep -v "%%" > biblio.bib
