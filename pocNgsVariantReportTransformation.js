const fs = require('fs')
// require the library in your code
const { TransformerFactory, TransformerTypes } = require('eip-transformation-library')

// here I'm loading couple of files that contains a Variant Report xml file and an XSL file to transform it
const xml = fs.readFileSync('./examples/variantReport/variant-report-2.2.xml') // original xml version from compbio
const xsl = fs.readFileSync('./examples/variantReport/variant-report-2.2-to-external.xsl') // xsl transformation file
const jsonSchema = fs.readFileSync('./examples/variantReport/variant-report-2.2-external-schema.json') // json schema validation file

function transformXml () {
  // here I'm getting an instance of the Variant Report transformer by making use of the FActory
  const transformer = TransformerFactory.getInstance(TransformerTypes.variantReport)

  // example transforming XML Variant Report
  // by calling the transformXml method and passing over the XML content and also the XSL content
  transformer.transformXml(xml.toString(), xsl.toString())

  // here printing the result of the transformation
  if (transformer.result.errors.length === 0) {
    console.log('--- example XML NGS Final Report transformed from internal to external FMI------\n\n', transformer.result.content)
    fs.writeFileSync('./output/finalReportTransformed.xml', transformer.result.content)
  } else {
    console.log(transformer.result.errors)
  }
}

function transformXmlAndConvertToJson () {
  const transformer = TransformerFactory.getInstance(TransformerTypes.variantReport)

  // example transforming XML Variant Report and convert to JSON
  const xmlStr = xml.toString()
  const xslStr = xsl.toString()
  const jsonSchemaStr = jsonSchema.toString()
  transformer.transformXmlAndConvertToJson(xmlStr, xslStr, jsonSchemaStr)
  if (transformer.result.errors.length === 0) {
    console.log('--- example XML NGS Final Report transformed from internal to external FMI and converted to JSON format------\n\n', JSON.stringify(JSON.parse(transformer.result.content), null, 2))
    fs.writeFileSync('./output/finalReportTransformed.json', JSON.stringify(JSON.parse(transformer.result.content), null, 2))
  } else {
    console.log(transformer.result.errors)
  }
}

// transformXml()
transformXmlAndConvertToJson()