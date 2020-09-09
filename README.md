# Anticipation openfido script

Run a GRIP Anticipation simulation on a GLM network model and TMY3 weather file.

> GLM File: `anticipation_ieee123_pole_vulnerability.glm`

> TMY3 File: `CA-Bakersfield_Meadows_Field_HighWind-Mocked.tmy3`

Modify the starttime and stoptime in the `.glm` file to change the simulation duration:

```
clock {
   	starttime "2003-02-01T00:00:00Z";
   	stoptime '2003-02-02T00:00:00Z';
}
```
