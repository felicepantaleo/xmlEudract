# xmlEudract


### Generate output.xml
```
saxonb-xslt -xsl:transformation.xsl -s:input.xml -o:output.xml
```

Replace any `NA` with `0` in `output.xml` file

### Create a transformation XSL (Not used)

```
saxonb-xslt -xsl:generate_transformation_stubs.xsl -s:adverseEvents.xsd -o:transformation_stubs.xsl
```

### Validation

To validate the generated `output.xml`:

```
xmllint --schema adverseEvents.xsd output.xml --noout

```

