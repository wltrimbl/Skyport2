cwlVersion: v1.0
class: Workflow

# optional - additional requirements to execute this workflow
requirements:
  - class: StepInputExpressionRequirement

# required, workflow input mapping
inputs:
  pdf:
    type: File
    doc: PDF file for text extraction

# list of workflow steps
steps:
  # step name
  pdf2text:
    label: pdf2text
    doc: extract ascii text from PDF
    # path to tool
    run: pdftotext.cwl
    # assign values to step/tool inputs
    in:
      # assign workflow input to tool input:
      # <tool input name>:<workflow input name>
      pdf: pdf
      text:
        # assign constant output file name
        default: "extracted.txt"

    out: [extractedText]

# mapping of output parameter to step outputs
outputs:
  # name of output parameter
  words:
    type: File
    # assign value from specified step output to output parameter
    outputSource: pdf2text/extractedText
