#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { SORTMERNA } from '../../../software/sortmerna/main.nf' addParams( options: [:] )

workflow test_sortmerna_single_end_one_ref {

    def input = []
    input = [ [ id:'test', single_end:true ], // meta map
              file("${launchDir}/tests/data/genomics/sarscov2/bam/test_paired_end.bam", checkIfExists: true) ]

    SORTMERNA ( input )
}

// workflow test_sortmerna_paired_end {

//     def input = []
//     input = [ [ id:'test', single_end:false ], // meta map
//               file("${launchDir}/tests/data/genomics/sarscov2/bam/test_paired_end.bam", checkIfExists: true) ]

//     SORTMERNA ( input )
// }

// workflow test_sortmerna_single_end_two_refs {

//     def input = []
//     input = [ [ id:'test', single_end:true ], // meta map
//               file("${launchDir}/tests/data/genomics/sarscov2/bam/test_paired_end.bam", checkIfExists: true) ]

//     SORTMERNA ( input )
// }

// workflow test_sortmerna_paired_end_two_refs {

//     def input = []
//     input = [ [ id:'test', single_end:false ], // meta map
//               file("${launchDir}/tests/data/genomics/sarscov2/bam/test_paired_end.bam", checkIfExists: true) ]

//     SORTMERNA ( input )
}
