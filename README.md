# xmlEudract

### Create a transformation XSL

```
saxonb-xslt -xsl:generate_transformation_stubs.xsl -s:adverseEvents.xsd -o:transformation.xsl
```

### Validation

To validate the generated `output.xml`:

```
xmllint --schema adverseEvents.xsd output.xml --noout

```
