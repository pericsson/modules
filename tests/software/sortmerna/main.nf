#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { SORTMERNA } from '../../../software/sortmerna/main.nf' addParams( options: [args: '--fastx'])

workflow test_sortmerna_single_end_one_ref {

    def input = []
    input = [ [ id:'test', single_end:true ], // meta map
              [ file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true) ]
            ]

    ref = [ file(params.test_data['sarscov2']['genome']['transcriptome_fasta'], checkIfExists: true) ]

    SORTMERNA ( input, ref )
}

workflow test_sortmerna_paired_end_one_ref {

    def input = []
    input = [ [ id:'test', single_end:false ], // meta map
              [ file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true),
                file(params.test_data['sarscov2']['illumina']['test_2_fastq_gz'], checkIfExists: true) ]
            ]

    ref = [ file(params.test_data['sarscov2']['genome']['transcriptome_fasta'], checkIfExists: true) ]

    SORTMERNA ( input, ref )
}

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
// }
