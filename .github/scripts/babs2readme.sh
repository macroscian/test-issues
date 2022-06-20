#!/bin/bash
babs () { sed -n  "s/ *$1: *//p" .babs;}
cat <<EOF > bot_tmp_para.txt
## $(babs Project)
This is a project for $(babs Scientist) in the $(babs Lab) Lab.

The initial ticket was created on $(babs Created) and has an estimate
of $(babs Estimate) hours, to be charged against code $(babs Code).

It was initially allocated to $(babs Bioinformatician), is classed
as $(babs Type), and has BABS reference $(babs Hash).

You can find the project proposal document [here](babs/proposal.docx).
EOF
lead='<!--BABSSTART-->'
tail='<!--BABSEND-->'
sed -e "/$lead/,/$tail/{ /$lead/{p; r bot_tmp_para.txt
}; /$tail/p; d }"  readme.md > bot_tmp_readme.txt
mv bot_tmp_readme.txt readme.md
rm -f bot_tmp_para.txt bot_tmp_readme.txt
#git config user.email "bioinformatics@crick.ac.uk"
#git config user.name "BABS Bot"
#git commit readme.md -m "Auto-render readme.md" || echo "No changes to commit"
#git push origin || echo "No changes to commit"
