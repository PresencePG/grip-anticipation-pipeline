#!/bin/sh

# errexit: abort script at first error
set -e

echo "OPENFIDO_INPUT = $OPENFIDO_INPUT"
echo "OPENFIDO_OUTPUT = $OPENFIDO_OUTPUT"

if ! ls -1 $OPENFIDO_INPUT/*.glm; then
  echo "Input .glm file not found"
  exit 1
fi

if ! ls -1 $OPENFIDO_INPUT/*.tmy3; then
  echo "Input .tmy3 file not found"
  exit 1
fi

path_to_tmp_dir=tmp

echo "Copying input files to working directory"
cp -r $OPENFIDO_INPUT/* .

input_glm=`ls -1 $OPENFIDO_INPUT/*.glm | sed 's#.*/##'`
echo "Input GLM: $input_glm"

echo "Running GridLabD"

python3 -u run_gridlabd_main.py \
-i $input_glm \
-o ${input_glm%.*}_post_run.json

mv *.json $OPENFIDO_OUTPUT
mv *.csv $OPENFIDO_OUTPUT
mv gridlabd.* $OPENFIDO_OUTPUT
mv *.txt $OPENFIDO_OUTPUT
