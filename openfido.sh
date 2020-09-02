#!/bin/sh

# errexit: abort script at first error
set -e

echo "OPENFIDO_INPUT = $OPENFIDO_INPUT"
echo "OPENFIDO_OUTPUT = $OPENFIDO_OUTPUT"

docker run --rm --name gridlabd_1_1_anticipation \
-v $OPENFIDO_INPUT:/model \
-v $OPENFIDO_INPUT/tmp:/tmp \
-v /var/run/docker.sock:/var/run/docker.sock \
-w /model slacgrip/master:200527 \
python3 -u run_gridlabd_main.py \
-W /model \
-i $OPENFIDO_OUTPUT/anticipation_ieee123_pole_vulnerability.glm \
-o $OPENFIDO_OUTPUT/anticipation_ieee123_pole_vulnerability_post_run.json

echo "Output files expected:
ieee123_model_1.csv
ieee123_model_2.csv
ieee123_model_3.csv
anticipation_ieee123_pole_vulnerability_post_run.json"
