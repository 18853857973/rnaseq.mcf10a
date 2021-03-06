

# A treemap R script produced by the REVIGO server at http://revigo.irb.hr/
# If you found REVIGO useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800

# author: Anton Kratz <anton.kratz@gmail.com>, RIKEN Omics Science Center, Functional Genomics Technology Team, Japan
# created: Fri, Nov 02, 2012  7:25:52 PM
# last change: Fri, Nov 09, 2012  3:20:01 PM

# -----------------------------------------------------------------------------
# If you don't have the treemap package installed, uncomment the following line:
# install.packages( "treemap" );
library(treemap) 								# treemap package by Martijn Tennekes

# Set the working directory if necessary
# setwd("C:/Users/username/workingdir");

# --------------------------------------------------------------------------
# Here is your data from REVIGO. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","freqInDbPercent","abslog10pvalue","uniqueness","dispensability","representative");
revigo.data <- rbind(c("GO:0010046","response to mycotoxin",0.009,2.1337,0.959,0.000,"response to mycotoxin"),
c("GO:0071279","cellular response to cobalt ion",0.001,1.4448,0.914,0.216,"response to mycotoxin"),
c("GO:0070555","response to interleukin-1",0.154,1.4515,0.947,0.283,"response to mycotoxin"),
c("GO:0072702","response to methyl methanesulfonate",0.001,1.4448,0.960,0.294,"response to mycotoxin"),
c("GO:0072703","cellular response to methyl methanesulfonate",0.001,1.4448,0.914,0.294,"response to mycotoxin"),
c("GO:0071393","cellular response to progesterone stimulus",0.002,1.4448,0.909,0.306,"response to mycotoxin"),
c("GO:0051595","response to methylglyoxal",0.008,1.4448,0.955,0.336,"response to mycotoxin"),
c("GO:0034696","response to prostaglandin F",0.002,1.4448,0.957,0.353,"response to mycotoxin"),
c("GO:0061400","positive regulation of transcription from RNA polymerase II promoter in response to calcium ion",0.011,1.4448,0.708,0.591,"response to mycotoxin"),
c("GO:0071347","cellular response to interleukin-1",0.096,1.5311,0.888,0.616,"response to mycotoxin"),
c("GO:0016226","iron-sulfur cluster assembly",0.047,2.2140,0.839,0.000,"iron-sulfur cluster assembly"),
c("GO:0032988","ribonucleoprotein complex disassembly",0.018,1.7562,0.874,0.225,"iron-sulfur cluster assembly"),
c("GO:0097032","mitochondrial respiratory chain complex II biogenesis",0.001,1.4448,0.932,0.302,"iron-sulfur cluster assembly"),
c("GO:0007172","signal complex assembly",0.030,1.6205,0.771,0.373,"iron-sulfur cluster assembly"),
c("GO:0031163","metallo-sulfur cluster assembly",0.047,2.2140,0.919,0.384,"iron-sulfur cluster assembly"),
c("GO:0065005","protein-lipid complex assembly",0.026,1.4069,0.915,0.416,"iron-sulfur cluster assembly"),
c("GO:0034552","respiratory chain complex II assembly",0.001,1.4448,0.927,0.461,"iron-sulfur cluster assembly"),
c("GO:0000390","spliceosomal complex disassembly",0.006,1.4448,0.786,0.619,"iron-sulfur cluster assembly"),
c("GO:0051881","regulation of mitochondrial membrane potential",0.095,3.3188,0.900,0.000,"regulation of mitochondrial membrane potential"),
c("GO:0061157","mRNA destabilization",0.009,2.4237,0.798,0.298,"regulation of mitochondrial membrane potential"),
c("GO:1901030","positive regulation of mitochondrial outer membrane permeabilization involved in apoptotic signaling pathway",0.010,2.8416,0.681,0.300,"regulation of mitochondrial membrane potential"),
c("GO:0032471","negative regulation of endoplasmic reticulum calcium ion concentration",0.021,1.6205,0.875,0.313,"regulation of mitochondrial membrane potential"),
c("GO:0048102","autophagic cell death",0.011,1.9219,0.900,0.335,"regulation of mitochondrial membrane potential"),
c("GO:0032350","regulation of hormone metabolic process",0.067,1.6003,0.809,0.339,"regulation of mitochondrial membrane potential"),
c("GO:0007005","mitochondrion organization",0.649,2.4449,0.862,0.347,"regulation of mitochondrial membrane potential"),
c("GO:0007290","spermatid nucleus elongation",0.014,1.4448,0.810,0.354,"regulation of mitochondrial membrane potential"),
c("GO:0035526","retrograde transport, plasma membrane to Golgi",0.003,1.4448,0.944,0.369,"regulation of mitochondrial membrane potential"),
c("GO:0051928","positive regulation of calcium ion transport",0.122,1.3350,0.883,0.417,"regulation of mitochondrial membrane potential"),
c("GO:0042391","regulation of membrane potential",1.008,1.5977,0.890,0.419,"regulation of mitochondrial membrane potential"),
c("GO:1990144","intrinsic apoptotic signaling pathway in response to hypoxia",0.001,1.4448,0.807,0.421,"regulation of mitochondrial membrane potential"),
c("GO:0002260","lymphocyte homeostasis",0.164,1.5311,0.896,0.446,"regulation of mitochondrial membrane potential"),
c("GO:0051130","positive regulation of cellular component organization",1.698,2.2403,0.823,0.473,"regulation of mitochondrial membrane potential"),
c("GO:0060065","uterus development",0.042,1.4069,0.905,0.480,"regulation of mitochondrial membrane potential"),
c("GO:0031274","positive regulation of pseudopodium assembly",0.014,1.7562,0.787,0.483,"regulation of mitochondrial membrane potential"),
c("GO:0034553","mitochondrial respiratory chain complex II assembly",0.001,1.4448,0.865,0.487,"regulation of mitochondrial membrane potential"),
c("GO:0070159","mitochondrial threonyl-tRNA aminoacylation",0.001,1.4448,0.724,0.487,"regulation of mitochondrial membrane potential"),
c("GO:2001268","negative regulation of cysteine-type endopeptidase activity involved in apoptotic signaling pathway",0.003,1.4448,0.714,0.497,"regulation of mitochondrial membrane potential"),
c("GO:0051128","regulation of cellular component organization",3.835,1.7873,0.842,0.499,"regulation of mitochondrial membrane potential"),
c("GO:0031133","regulation of axon diameter",0.006,1.4448,0.748,0.502,"regulation of mitochondrial membrane potential"),
c("GO:0045806","negative regulation of endocytosis",0.080,2.0742,0.761,0.559,"regulation of mitochondrial membrane potential"),
c("GO:0060068","vagina development",0.051,1.3203,0.904,0.573,"regulation of mitochondrial membrane potential"),
c("GO:0006897","endocytosis",1.430,1.3782,0.954,0.581,"regulation of mitochondrial membrane potential"),
c("GO:0043487","regulation of RNA stability",0.093,1.4888,0.765,0.582,"regulation of mitochondrial membrane potential"),
c("GO:0045837","negative regulation of membrane potential",0.023,1.5058,0.909,0.593,"regulation of mitochondrial membrane potential"),
c("GO:0051900","regulation of mitochondrial depolarization",0.028,2.8416,0.841,0.602,"regulation of mitochondrial membrane potential"),
c("GO:2001233","regulation of apoptotic signaling pathway",0.765,2.2840,0.738,0.615,"regulation of mitochondrial membrane potential"),
c("GO:0031334","positive regulation of protein complex assembly",0.286,1.6112,0.827,0.631,"regulation of mitochondrial membrane potential"),
c("GO:0010821","regulation of mitochondrion organization",0.142,2.3851,0.765,0.636,"regulation of mitochondrial membrane potential"),
c("GO:1902117","positive regulation of organelle assembly",0.026,1.4069,0.804,0.640,"regulation of mitochondrial membrane potential"),
c("GO:0051260","protein homooligomerization",0.561,1.3599,0.900,0.645,"regulation of mitochondrial membrane potential"),
c("GO:0097190","apoptotic signaling pathway",1.253,1.8216,0.753,0.665,"regulation of mitochondrial membrane potential"),
c("GO:0097285","cell-type specific apoptotic process",1.126,1.3447,0.860,0.694,"regulation of mitochondrial membrane potential"),
c("GO:0008053","mitochondrial fusion",0.043,1.9048,0.828,0.700,"regulation of mitochondrial membrane potential"),
c("GO:0060325","face morphogenesis",0.182,2.6126,0.898,0.000,"face morphogenesis"),
c("GO:0014012","peripheral nervous system axon regeneration",0.018,2.4237,0.781,0.256,"face morphogenesis"),
c("GO:0002352","B cell negative selection",0.009,2.4237,0.868,0.259,"face morphogenesis"),
c("GO:0048569","post-embryonic organ development",0.038,2.1007,0.911,0.281,"face morphogenesis"),
c("GO:0021560","abducens nerve development",0.001,1.4448,0.919,0.286,"face morphogenesis"),
c("GO:0021570","rhombomere 4 development",0.005,1.4448,0.917,0.308,"face morphogenesis"),
c("GO:0060322","head development",0.238,1.7799,0.914,0.310,"face morphogenesis"),
c("GO:0007568","aging",0.730,1.6234,0.911,0.324,"face morphogenesis"),
c("GO:0009791","post-embryonic development",0.281,1.3799,0.908,0.329,"face morphogenesis"),
c("GO:0060021","palate development",0.311,1.3597,0.924,0.331,"face morphogenesis"),
c("GO:0031099","regeneration",0.350,1.3303,0.911,0.336,"face morphogenesis"),
c("GO:0048597","post-embryonic camera-type eye morphogenesis",0.010,2.1337,0.891,0.341,"face morphogenesis"),
c("GO:0006979","response to oxidative stress",0.874,2.0799,0.958,0.344,"face morphogenesis"),
c("GO:0035270","endocrine system development",0.434,1.3063,0.901,0.344,"face morphogenesis"),
c("GO:1900103","positive regulation of endoplasmic reticulum unfolded protein response",0.005,1.9219,0.807,0.348,"face morphogenesis"),
c("GO:1902262","apoptotic process involved in patterning of blood vessels",0.018,1.9219,0.824,0.355,"face morphogenesis"),
c("GO:0060253","negative regulation of glial cell proliferation",0.023,1.7562,0.778,0.394,"face morphogenesis"),
c("GO:0070231","T cell apoptotic process",0.136,1.6211,0.882,0.404,"face morphogenesis"),
c("GO:0031268","pseudopodium organization",0.025,1.4069,0.874,0.414,"face morphogenesis"),
c("GO:0031214","biomineral tissue development",0.252,1.3799,0.897,0.416,"face morphogenesis"),
c("GO:0002230","positive regulation of defense response to virus by host",0.021,1.5058,0.902,0.417,"face morphogenesis"),
c("GO:0035966","response to topologically incorrect protein",0.209,1.4843,0.940,0.421,"face morphogenesis"),
c("GO:0060806","negative regulation of cell differentiation involved in embryonic placenta development",0.001,1.4448,0.808,0.424,"face morphogenesis"),
c("GO:0010171","body morphogenesis",0.222,2.0575,0.904,0.426,"face morphogenesis"),
c("GO:0071726","cellular response to diacyl bacterial lipopeptide",0.002,1.4448,0.905,0.429,"face morphogenesis"),
c("GO:0030177","positive regulation of Wnt signaling pathway",0.177,1.7286,0.778,0.449,"face morphogenesis"),
c("GO:0060876","semicircular canal formation",0.005,1.4448,0.899,0.501,"face morphogenesis"),
c("GO:0021993","initiation of neural tube closure",0.006,1.4448,0.904,0.513,"face morphogenesis"),
c("GO:0042127","regulation of cell proliferation",3.148,1.5077,0.822,0.518,"face morphogenesis"),
c("GO:0035659","Wnt signaling pathway involved in wound healing, spreading of epidermal cells",0.001,1.4448,0.786,0.529,"face morphogenesis"),
c("GO:0060536","cartilage morphogenesis",0.136,1.6205,0.888,0.547,"face morphogenesis"),
c("GO:0060040","retinal bipolar neuron differentiation",0.006,1.4448,0.856,0.622,"face morphogenesis"),
c("GO:0021562","vestibulocochlear nerve development",0.009,1.4448,0.911,0.627,"face morphogenesis"),
c("GO:0021599","abducens nerve formation",0.001,1.4448,0.910,0.627,"face morphogenesis"),
c("GO:0002339","B cell selection",0.010,2.4237,0.867,0.641,"face morphogenesis"),
c("GO:0090102","cochlea development",0.091,1.4224,0.897,0.651,"face morphogenesis"),
c("GO:0060800","regulation of cell differentiation involved in embryonic placenta development",0.001,1.4448,0.831,0.654,"face morphogenesis"),
c("GO:0009886","post-embryonic morphogenesis",0.027,1.4069,0.901,0.674,"face morphogenesis"),
c("GO:1900101","regulation of endoplasmic reticulum unfolded protein response",0.006,1.7562,0.819,0.676,"face morphogenesis"),
c("GO:0009399","nitrogen fixation",0.001,1.4448,0.915,0.029,"nitrogen fixation"),
c("GO:0090346","cellular organofluorine metabolic process",0.002,1.4448,0.925,0.030,"cellular organofluorine metabolism"),
c("GO:0071461","cellular response to redox state",0.001,1.4448,0.979,0.038,"cellular response to redox state"),
c("GO:0043497","regulation of protein heterodimerization activity",0.016,1.9219,0.905,0.042,"regulation of protein heterodimerization activity"),
c("GO:2000326","negative regulation of ligand-dependent nuclear receptor transcription coactivator activity",0.001,1.4448,0.873,0.259,"regulation of protein heterodimerization activity"),
c("GO:0090045","positive regulation of deacetylase activity",0.007,1.7562,0.830,0.284,"regulation of protein heterodimerization activity"),
c("GO:2000678","negative regulation of transcription regulatory region DNA binding",0.136,1.5058,0.889,0.674,"regulation of protein heterodimerization activity"),
c("GO:0090345","cellular organohalogen metabolic process",0.002,1.4448,0.925,0.047,"cellular organohalogen metabolism"),
c("GO:0007264","small GTPase mediated signal transduction",2.633,2.8386,0.761,0.062,"small GTPase mediated signal transduction"),
c("GO:0019222","regulation of metabolic process",17.756,2.8477,0.850,0.131,"small GTPase mediated signal transduction"),
c("GO:0065009","regulation of molecular function",6.209,1.7199,0.919,0.145,"small GTPase mediated signal transduction"),
c("GO:0050847","progesterone receptor signaling pathway",0.008,1.9219,0.855,0.235,"small GTPase mediated signal transduction"),
c("GO:0048518","positive regulation of biological process",28.712,1.8557,0.894,0.236,"small GTPase mediated signal transduction"),
c("GO:0048583","regulation of response to stimulus",26.518,1.5452,0.881,0.273,"small GTPase mediated signal transduction"),
c("GO:0048522","positive regulation of cellular process",8.548,2.3080,0.802,0.289,"small GTPase mediated signal transduction"),
c("GO:0032862","activation of Rho GTPase activity",0.050,1.7409,0.582,0.449,"small GTPase mediated signal transduction"),
c("GO:0007250","activation of NF-kappaB-inducing kinase activity",0.054,2.7878,0.647,0.451,"small GTPase mediated signal transduction"),
c("GO:0010646","regulation of cell communication",6.570,1.6507,0.768,0.452,"small GTPase mediated signal transduction"),
c("GO:0023051","regulation of signaling",6.570,1.6619,0.859,0.456,"small GTPase mediated signal transduction"),
c("GO:0038061","NIK/NF-kappaB signaling",0.080,2.3840,0.824,0.468,"small GTPase mediated signal transduction"),
c("GO:0051336","regulation of hydrolase activity",3.070,2.0975,0.728,0.506,"small GTPase mediated signal transduction"),
c("GO:0019220","regulation of phosphate metabolic process",4.763,1.6651,0.637,0.547,"small GTPase mediated signal transduction"),
c("GO:0045862","positive regulation of proteolysis",0.158,2.5406,0.706,0.550,"small GTPase mediated signal transduction"),
c("GO:0051098","regulation of binding",0.553,1.3933,0.882,0.600,"small GTPase mediated signal transduction"),
c("GO:0032856","activation of Ras GTPase activity",0.080,1.5370,0.568,0.625,"small GTPase mediated signal transduction"),
c("GO:0007265","Ras protein signal transduction",1.560,2.2104,0.770,0.647,"small GTPase mediated signal transduction"),
c("GO:0008635","activation of cysteine-type endopeptidase activity involved in apoptotic process by cytochrome c",0.021,1.7562,0.713,0.651,"small GTPase mediated signal transduction"),
c("GO:0010248","establishment or maintenance of transmembrane electrochemical gradient",0.005,2.4237,0.916,0.064,"establishment or maintenance of transmembrane electrochemical gradient"),
c("GO:0072683","T cell extravasation",0.008,1.4448,0.886,0.139,"establishment or maintenance of transmembrane electrochemical gradient"),
c("GO:0071169","establishment of protein localization to chromatin",0.007,1.4448,0.962,0.153,"establishment or maintenance of transmembrane electrochemical gradient"),
c("GO:0006860","extracellular amino acid transport",0.002,1.4448,0.956,0.227,"establishment or maintenance of transmembrane electrochemical gradient"),
c("GO:1902389","ceramide 1-phosphate transport",0.001,1.4448,0.957,0.418,"establishment or maintenance of transmembrane electrochemical gradient"),
c("GO:0034381","plasma lipoprotein particle clearance",0.076,1.6680,0.895,0.065,"plasma lipoprotein particle clearance"),
c("GO:0002021","response to dietary excess",0.036,1.4069,0.921,0.213,"plasma lipoprotein particle clearance"),
c("GO:0001964","startle response",0.066,1.3203,0.918,0.390,"plasma lipoprotein particle clearance"),
c("GO:0010225","response to UV-C",0.027,2.3401,0.954,0.067,"response to UV-C"),
c("GO:0071260","cellular response to mechanical stimulus",0.133,1.5867,0.882,0.499,"response to UV-C"),
c("GO:0007634","optokinetic behavior",0.001,1.4448,0.921,0.510,"response to UV-C"),
c("GO:0071214","cellular response to abiotic stimulus",0.450,1.3599,0.880,0.616,"response to UV-C"),
c("GO:0010629","negative regulation of gene expression",2.446,2.7959,0.685,0.096,"negative regulation of gene expression"),
c("GO:1901068","guanosine-containing compound metabolic process",2.687,2.7167,0.672,0.132,"negative regulation of gene expression"),
c("GO:0051085","chaperone mediated protein folding requiring cofactor",0.052,1.4069,0.865,0.150,"negative regulation of gene expression"),
c("GO:0006725","cellular aromatic compound metabolic process",24.907,2.1844,0.813,0.200,"negative regulation of gene expression"),
c("GO:0006807","nitrogen compound metabolic process",26.566,2.0362,0.892,0.201,"negative regulation of gene expression"),
c("GO:1901360","organic cyclic compound metabolic process",25.430,1.9763,0.838,0.202,"negative regulation of gene expression"),
c("GO:0070988","demethylation",0.408,2.0074,0.881,0.214,"negative regulation of gene expression"),
c("GO:0032805","positive regulation of low-density lipoprotein particle receptor catabolic process",0.001,1.4448,0.747,0.216,"negative regulation of gene expression"),
c("GO:0071897","DNA biosynthetic process",0.291,1.8834,0.775,0.227,"negative regulation of gene expression"),
c("GO:0043602","nitrate catabolic process",0.005,1.4448,0.789,0.254,"negative regulation of gene expression"),
c("GO:0007072","positive regulation of transcription on exit from mitosis",0.001,1.4448,0.729,0.256,"negative regulation of gene expression"),
c("GO:0010726","positive regulation of hydrogen peroxide metabolic process",0.002,1.4448,0.811,0.256,"negative regulation of gene expression"),
c("GO:0050810","regulation of steroid biosynthetic process",0.133,1.8225,0.744,0.275,"negative regulation of gene expression"),
c("GO:0046210","nitric oxide catabolic process",0.005,1.4448,0.829,0.296,"negative regulation of gene expression"),
c("GO:0046054","dGMP metabolic process",0.001,1.4448,0.816,0.296,"negative regulation of gene expression"),
c("GO:0010467","gene expression",15.379,2.6757,0.815,0.304,"negative regulation of gene expression"),
c("GO:0046092","deoxycytidine metabolic process",0.002,1.4448,0.818,0.316,"negative regulation of gene expression"),
c("GO:0046293","formaldehyde biosynthetic process",0.001,1.4448,0.838,0.322,"negative regulation of gene expression"),
c("GO:0018400","peptidyl-proline hydroxylation to 3-hydroxy-L-proline",0.003,1.4448,0.805,0.333,"negative regulation of gene expression"),
c("GO:0043043","peptide biosynthetic process",0.071,1.4779,0.796,0.346,"negative regulation of gene expression"),
c("GO:0046483","heterocycle metabolic process",24.799,2.1599,0.814,0.359,"negative regulation of gene expression"),
c("GO:0009162","deoxyribonucleoside monophosphate metabolic process",0.028,1.7562,0.790,0.362,"negative regulation of gene expression"),
c("GO:0040037","negative regulation of fibroblast growth factor receptor signaling pathway",0.035,2.3401,0.773,0.385,"negative regulation of gene expression"),
c("GO:0006029","proteoglycan metabolic process",0.173,2.2636,0.790,0.403,"negative regulation of gene expression"),
c("GO:0019464","glycine decarboxylation via glycine cleavage system",0.006,1.4448,0.785,0.407,"negative regulation of gene expression"),
c("GO:0044725","chromatin reprogramming in the zygote",0.003,1.4448,0.746,0.415,"negative regulation of gene expression"),
c("GO:0006139","nucleobase-containing compound metabolic process",24.258,2.5482,0.700,0.417,"negative regulation of gene expression"),
c("GO:0051174","regulation of phosphorus metabolic process",4.788,1.5786,0.654,0.421,"negative regulation of gene expression"),
c("GO:1900477","negative regulation of G1/S transition of mitotic cell cycle by negative regulation of transcription from RNA polymerase II promoter",0.001,1.4448,0.762,0.422,"negative regulation of gene expression"),
c("GO:1901675","negative regulation of histone H3-K27 acetylation",0.001,1.4448,0.714,0.422,"negative regulation of gene expression"),
c("GO:0033683","nucleotide-excision repair, DNA incision",0.009,1.7562,0.794,0.442,"negative regulation of gene expression"),
c("GO:0031146","SCF-dependent proteasomal ubiquitin-dependent protein catabolic process",0.027,1.4069,0.796,0.445,"negative regulation of gene expression"),
c("GO:0006366","transcription from RNA polymerase II promoter",3.963,1.3083,0.698,0.457,"negative regulation of gene expression"),
c("GO:0009893","positive regulation of metabolic process",5.415,1.8713,0.743,0.477,"negative regulation of gene expression"),
c("GO:2000278","regulation of DNA biosynthetic process",0.060,1.3203,0.725,0.505,"negative regulation of gene expression"),
c("GO:0006270","DNA replication initiation",0.088,1.6003,0.799,0.520,"negative regulation of gene expression"),
c("GO:0044260","cellular macromolecule metabolic process",25.627,1.7462,0.761,0.524,"negative regulation of gene expression"),
c("GO:0036123","histone H3-K9 dimethylation",0.013,1.4448,0.776,0.532,"negative regulation of gene expression"),
c("GO:0042059","negative regulation of epidermal growth factor receptor signaling pathway",0.071,2.0074,0.778,0.535,"negative regulation of gene expression"),
c("GO:0030510","regulation of BMP signaling pathway",0.248,1.5311,0.640,0.552,"negative regulation of gene expression"),
c("GO:0009118","regulation of nucleoside metabolic process",1.901,1.6859,0.583,0.597,"negative regulation of gene expression"),
c("GO:0016070","RNA metabolic process",12.843,1.8459,0.690,0.605,"negative regulation of gene expression"),
c("GO:0019219","regulation of nucleobase-containing compound metabolic process",12.840,3.7212,0.573,0.612,"negative regulation of gene expression"),
c("GO:0009207","purine ribonucleoside triphosphate catabolic process",3.700,2.6655,0.610,0.617,"negative regulation of gene expression"),
c("GO:0031325","positive regulation of cellular metabolic process",5.082,2.0560,0.661,0.619,"negative regulation of gene expression"),
c("GO:0090304","nucleic acid metabolic process",15.268,1.9801,0.701,0.636,"negative regulation of gene expression"),
c("GO:0009892","negative regulation of metabolic process",3.994,1.6194,0.729,0.648,"negative regulation of gene expression"),
c("GO:0034654","nucleobase-containing compound biosynthetic process",13.254,1.7190,0.681,0.660,"negative regulation of gene expression"),
c("GO:1901657","glycosyl compound metabolic process",8.489,1.6440,0.745,0.661,"negative regulation of gene expression"),
c("GO:0009889","regulation of biosynthetic process",11.561,1.8681,0.687,0.675,"negative regulation of gene expression"),
c("GO:0009894","regulation of catabolic process",2.662,1.7149,0.686,0.677,"negative regulation of gene expression"),
c("GO:0010468","regulation of gene expression",11.954,2.2510,0.667,0.681,"negative regulation of gene expression"),
c("GO:1901362","organic cyclic compound biosynthetic process",13.849,1.6664,0.730,0.683,"negative regulation of gene expression"),
c("GO:0044271","cellular nitrogen compound biosynthetic process",13.670,1.6501,0.704,0.689,"negative regulation of gene expression"),
c("GO:0019438","aromatic compound biosynthetic process",13.512,1.6409,0.711,0.693,"negative regulation of gene expression"),
c("GO:0018130","heterocycle biosynthetic process",13.553,1.6133,0.710,0.693,"negative regulation of gene expression"),
c("GO:0030204","chondroitin sulfate metabolic process",0.089,1.7799,0.741,0.694,"negative regulation of gene expression"),
c("GO:0034641","cellular nitrogen compound metabolic process",25.263,1.9465,0.730,0.697,"negative regulation of gene expression"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$abslog10pvalue <- as.numeric( as.character(stuff$abslog10pvalue) );
stuff$freqInDbPercent <- as.numeric( as.character(stuff$freqInDbPercent) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="revigo_treemap.pdf", width=16, height=9 ) # width and height are in inches

# check the tmPlot command documentation for all possible parameters - there are a lot more
tmPlot(
	stuff,
	index = c("representative","description"),
	vSize = "abslog10pvalue",
	type = "categorical",
	vColor = "representative",
	title = "REVIGO Gene Ontology treemap",
	inflate.labels = FALSE,      # set this to TRUE for space-filling group labels - good for posters
	lowerbound.cex.labels = 0,   # try to draw as many labels as possible (still, some small squares may not get a label)
	bg.labels = "#CCCCCCAA",     # define background color of group labels
												       # "#CCCCCC00" is fully transparent, "#CCCCCCAA" is semi-transparent grey, NA is opaque
	position.legend = "none"
)

dev.off()
