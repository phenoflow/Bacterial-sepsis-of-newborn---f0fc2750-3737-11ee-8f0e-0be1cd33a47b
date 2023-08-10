cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  fetal-bacterial-sepsis-of-newborn---primary:
    run: fetal-bacterial-sepsis-of-newborn---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  bacterial-sepsis-of-newborn-streptococci---primary:
    run: bacterial-sepsis-of-newborn-streptococci---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: fetal-bacterial-sepsis-of-newborn---primary/output
  congenital-bacterial-sepsis-of-newborn---primary:
    run: congenital-bacterial-sepsis-of-newborn---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: bacterial-sepsis-of-newborn-streptococci---primary/output
  other-bacterial-sepsis-of-newborn---primary:
    run: other-bacterial-sepsis-of-newborn---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: congenital-bacterial-sepsis-of-newborn---primary/output
  bacterial-sepsis-of-newborn-staphylococcu---primary:
    run: bacterial-sepsis-of-newborn-staphylococcu---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: other-bacterial-sepsis-of-newborn---primary/output
  bacterial-sepsis-of-newborn---primary:
    run: bacterial-sepsis-of-newborn---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: bacterial-sepsis-of-newborn-staphylococcu---primary/output
  bacterial-sepsis-of-newborn-specified---primary:
    run: bacterial-sepsis-of-newborn-specified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: bacterial-sepsis-of-newborn---primary/output
  bacterial-sepsis-of-newborn-septicaemia---primary:
    run: bacterial-sepsis-of-newborn-septicaemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: bacterial-sepsis-of-newborn-specified---primary/output
  perinatal-bacterial-sepsis-of-newborn---primary:
    run: perinatal-bacterial-sepsis-of-newborn---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: bacterial-sepsis-of-newborn-septicaemia---primary/output
  bacterial-sepsis-bacterial-sepsis-of-newborn-newborn---secondary:
    run: bacterial-sepsis-bacterial-sepsis-of-newborn-newborn---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: perinatal-bacterial-sepsis-of-newborn---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: bacterial-sepsis-bacterial-sepsis-of-newborn-newborn---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
