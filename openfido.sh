#!/bin/sh

# errexit: abort script at first error
set -e

echo "OPENFIDO_INPUT = $OPENFIDO_INPUT"
echo "OPENFIDO_OUTPUT = $OPENFIDO_OUTPUT"

if ls -1 $OPENFIDO_INPUT/*.glm; then # TODO: redirect input of ls elsewhere
  input_glm=`ls -1 $OPENFIDO_INPUT/*.glm | head -n 1`
  echo "Input GLM: $input_glm"

  if ls $OPENFIDO_INPUT/*.tmy3 | grep -q .tmy3; then
    echo "Running GridLabD"

    # Run GridLabD command
    python3 -u run_gridlabd_main.py \
    -i $input_glm \
    -o "${input_glm%.*}_post_run.json"
  else
    echo "Input .tmy3 file not found"
    exit 1
  fi
else
  echo "Input .glm file not found"
  exit 1
fi

mv *.csv $OPENFIDO_OUTPUT                             # will error out with exit code 1
mv "${input_glm%.*}_post_run.json" $OPENFIDO_OUTPUT
mv gridlabd.* $OPENFIDO_OUTPUT
mv *.txt $OPENFIDO_OUTPUT
