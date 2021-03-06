

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
revigo.data <- rbind(c("GO:0002376","immune system process",29.354,3.7212,0.997,0.000,"immune system process"),
c("GO:0006622","protein targeting to lysosome",0.015,3.2291,0.928,0.000,"protein targeting to lysosome"),
c("GO:0035444","nickel cation transmembrane transport",0.008,1.5768,0.907,0.189,"protein targeting to lysosome"),
c("GO:0032879","regulation of localization",4.330,1.7978,0.891,0.226,"protein targeting to lysosome"),
c("GO:0015739","sialic acid transport",0.002,1.5768,0.950,0.275,"protein targeting to lysosome"),
c("GO:0019915","lipid storage",0.141,2.4609,0.891,0.353,"protein targeting to lysosome"),
c("GO:0015692","lead ion transport",0.008,1.5768,0.947,0.394,"protein targeting to lysosome"),
c("GO:0048871","multicellular organismal homeostasis",0.562,1.9574,0.843,0.412,"protein targeting to lysosome"),
c("GO:0036438","maintenance of lens transparency",0.002,1.5768,0.889,0.418,"protein targeting to lysosome"),
c("GO:1990166","protein localization to site of double-strand break",0.001,1.5768,0.958,0.426,"protein targeting to lysosome"),
c("GO:0034499","late endosome to Golgi transport",0.003,1.5768,0.943,0.430,"protein targeting to lysosome"),
c("GO:0007034","vacuolar transport",0.067,1.9223,0.937,0.445,"protein targeting to lysosome"),
c("GO:2001153","positive regulation of renal water transport",0.007,1.5768,0.821,0.450,"protein targeting to lysosome"),
c("GO:0072665","protein localization to vacuole",0.019,2.8633,0.953,0.496,"protein targeting to lysosome"),
c("GO:0048203","vesicle targeting, trans-Golgi to endosome",0.002,1.5768,0.911,0.547,"protein targeting to lysosome"),
c("GO:0015676","vanadium ion transport",0.001,1.5768,0.948,0.561,"protein targeting to lysosome"),
c("GO:0015675","nickel cation transport",0.008,1.5768,0.943,0.642,"protein targeting to lysosome"),
c("GO:0015684","ferrous iron transport",0.016,1.5768,0.940,0.642,"protein targeting to lysosome"),
c("GO:0030730","sequestering of triglyceride",0.017,1.7540,0.904,0.655,"protein targeting to lysosome"),
c("GO:0071955","recycling endosome to Golgi transport",0.002,1.5768,0.944,0.672,"protein targeting to lysosome"),
c("GO:0070627","ferrous iron import",0.008,1.5768,0.942,0.689,"protein targeting to lysosome"),
c("GO:0019885","antigen processing and presentation of endogenous peptide antigen via MHC class I",0.018,1.7540,0.965,0.000,"antigen processing and presentation of endogenous peptide antigen via MHC class I"),
c("GO:0002457","T cell antigen processing and presentation",0.008,1.5768,0.941,0.117,"antigen processing and presentation of endogenous peptide antigen via MHC class I"),
c("GO:0019883","antigen processing and presentation of endogenous antigen",0.022,1.6525,0.968,0.123,"antigen processing and presentation of endogenous peptide antigen via MHC class I"),
c("GO:0022414","reproductive process",3.108,1.6413,0.996,0.000,"reproductive process"),
c("GO:0022610","biological adhesion",2.826,2.1101,0.995,0.000,"biological adhesion"),
c("GO:0023052","signaling",17.329,2.3487,0.996,0.000,"signaling"),
c("GO:0032501","multicellular organismal process",15.657,3.2291,0.996,0.000,"multicellular organismal process"),
c("GO:0032502","developmental process",13.055,3.2441,0.996,0.000,"developmental process"),
c("GO:0050896","response to stimulus",47.248,3.0809,0.998,0.000,"response to stimulus"),
c("GO:0051704","multi-organism process",4.431,2.4089,0.996,0.000,"multi-organism process"),
c("GO:0071216","cellular response to biotic stimulus",0.370,5.4949,0.840,0.000,"cellular response to biotic stimulus"),
c("GO:2001237","negative regulation of extrinsic apoptotic signaling pathway",0.243,3.5229,0.705,0.231,"cellular response to biotic stimulus"),
c("GO:0038195","urokinase plasminogen activator signaling pathway",0.001,1.5768,0.855,0.253,"cellular response to biotic stimulus"),
c("GO:0038034","signal transduction in absence of ligand",0.226,2.7986,0.806,0.253,"cellular response to biotic stimulus"),
c("GO:0071310","cellular response to organic substance",4.572,3.2076,0.786,0.309,"cellular response to biotic stimulus"),
c("GO:0007249","I-kappaB kinase/NF-kappaB signaling",0.425,3.0757,0.786,0.314,"cellular response to biotic stimulus"),
c("GO:2000348","regulation of CD40 signaling pathway",0.003,1.5768,0.821,0.327,"cellular response to biotic stimulus"),
c("GO:0030522","intracellular receptor signaling pathway",0.684,2.8356,0.788,0.332,"cellular response to biotic stimulus"),
c("GO:0007227","signal transduction downstream of smoothened",0.008,1.5768,0.829,0.339,"cellular response to biotic stimulus"),
c("GO:0050869","negative regulation of B cell activation",0.062,2.0985,0.806,0.349,"cellular response to biotic stimulus"),
c("GO:2000378","negative regulation of reactive oxygen species metabolic process",0.072,3.0315,0.818,0.353,"cellular response to biotic stimulus"),
c("GO:0003032","detection of oxygen",0.008,2.3925,0.924,0.356,"cellular response to biotic stimulus"),
c("GO:0043271","negative regulation of ion transport",0.145,2.7905,0.851,0.357,"cellular response to biotic stimulus"),
c("GO:0051968","positive regulation of synaptic transmission, glutamatergic",0.057,1.7540,0.790,0.377,"cellular response to biotic stimulus"),
c("GO:1901231","positive regulation of non-canonical Wnt signaling pathway via JNK cascade",0.001,1.5768,0.803,0.382,"cellular response to biotic stimulus"),
c("GO:2000009","negative regulation of protein localization to cell surface",0.011,2.0097,0.833,0.385,"cellular response to biotic stimulus"),
c("GO:0007495","visceral mesoderm-endoderm interaction involved in midgut development",0.002,1.5768,0.833,0.395,"cellular response to biotic stimulus"),
c("GO:0070106","interleukin-27-mediated signaling pathway",0.002,1.5768,0.821,0.400,"cellular response to biotic stimulus"),
c("GO:0035234","ectopic germ cell programmed cell death",0.023,2.0097,0.816,0.425,"cellular response to biotic stimulus"),
c("GO:0007167","enzyme linked receptor protein signaling pathway",2.356,1.6434,0.752,0.451,"cellular response to biotic stimulus"),
c("GO:0048585","negative regulation of response to stimulus",2.501,2.3778,0.824,0.462,"cellular response to biotic stimulus"),
c("GO:0060544","regulation of necroptotic process",0.025,2.0097,0.850,0.467,"cellular response to biotic stimulus"),
c("GO:0097151","positive regulation of inhibitory postsynaptic membrane potential",0.006,1.5768,0.866,0.471,"cellular response to biotic stimulus"),
c("GO:0071228","cellular response to tumor cell",0.001,1.5768,0.886,0.479,"cellular response to biotic stimulus"),
c("GO:1990267","response to transition metal nanoparticle",0.273,2.2749,0.904,0.497,"cellular response to biotic stimulus"),
c("GO:0002291","T cell activation via T cell receptor contact with antigen bound to MHC molecule on antigen presenting cell",0.006,1.5768,0.899,0.498,"cellular response to biotic stimulus"),
c("GO:0007166","cell surface receptor signaling pathway",8.919,3.2924,0.725,0.498,"cellular response to biotic stimulus"),
c("GO:0071364","cellular response to epidermal growth factor stimulus",0.048,2.3645,0.849,0.513,"cellular response to biotic stimulus"),
c("GO:0001975","response to amphetamine",0.093,2.1798,0.905,0.521,"cellular response to biotic stimulus"),
c("GO:0010038","response to metal ion",0.636,1.9439,0.890,0.548,"cellular response to biotic stimulus"),
c("GO:2000561","regulation of CD4-positive, alpha-beta T cell proliferation",0.003,1.5768,0.854,0.551,"cellular response to biotic stimulus"),
c("GO:0070849","response to epidermal growth factor",0.057,2.0985,0.906,0.553,"cellular response to biotic stimulus"),
c("GO:0035690","cellular response to drug",0.111,2.0150,0.847,0.557,"cellular response to biotic stimulus"),
c("GO:0010646","regulation of cell communication",6.570,2.9393,0.782,0.559,"cellular response to biotic stimulus"),
c("GO:0023051","regulation of signaling",6.570,2.9508,0.840,0.564,"cellular response to biotic stimulus"),
c("GO:0014075","response to amine",0.132,1.7097,0.903,0.568,"cellular response to biotic stimulus"),
c("GO:0010760","negative regulation of macrophage chemotaxis",0.002,1.5768,0.739,0.574,"cellular response to biotic stimulus"),
c("GO:0035967","cellular response to topologically incorrect protein",0.152,1.6700,0.797,0.575,"cellular response to biotic stimulus"),
c("GO:1902531","regulation of intracellular signal transduction",3.702,2.3747,0.700,0.576,"cellular response to biotic stimulus"),
c("GO:0010035","response to inorganic substance",1.004,2.2815,0.893,0.581,"cellular response to biotic stimulus"),
c("GO:0051957","positive regulation of amino acid transport",0.033,1.5768,0.874,0.595,"cellular response to biotic stimulus"),
c("GO:0043122","regulation of I-kappaB kinase/NF-kappaB signaling",0.382,1.9792,0.753,0.601,"cellular response to biotic stimulus"),
c("GO:0070164","negative regulation of adiponectin secretion",0.006,1.5768,0.745,0.603,"cellular response to biotic stimulus"),
c("GO:0010477","response to sulfur dioxide",0.005,1.5768,0.918,0.605,"cellular response to biotic stimulus"),
c("GO:0034021","response to silicon dioxide",0.006,1.5768,0.917,0.614,"cellular response to biotic stimulus"),
c("GO:0061400","positive regulation of transcription from RNA polymerase II promoter in response to calcium ion",0.011,1.5768,0.739,0.644,"cellular response to biotic stimulus"),
c("GO:0046651","lymphocyte proliferation",0.532,1.6712,0.862,0.677,"cellular response to biotic stimulus"),
c("GO:1901700","response to oxygen-containing compound",3.064,1.8133,0.881,0.679,"cellular response to biotic stimulus"),
c("GO:0007165","signal transduction",16.054,2.6055,0.709,0.683,"cellular response to biotic stimulus"),
c("GO:1900102","negative regulation of endoplasmic reticulum unfolded protein response",0.001,1.5768,0.752,0.689,"cellular response to biotic stimulus"),
c("GO:0010042","response to manganese ion",0.033,1.8713,0.911,0.697,"cellular response to biotic stimulus"),
c("GO:0051926","negative regulation of calcium ion transport",0.052,1.6525,0.856,0.698,"cellular response to biotic stimulus"),
c("GO:0007159","leukocyte cell-cell adhesion",0.106,3.2007,0.962,0.012,"leukocyte cell-cell adhesion"),
c("GO:0021812","neuronal-glial interaction involved in cerebral cortex radial glia guided migration",0.001,1.5768,0.820,0.544,"leukocyte cell-cell adhesion"),
c("GO:0034116","positive regulation of heterotypic cell-cell adhesion",0.010,2.3925,0.851,0.619,"leukocyte cell-cell adhesion"),
c("GO:0007155","cell adhesion",2.821,2.1192,0.978,0.665,"leukocyte cell-cell adhesion"),
c("GO:0016265","death",4.501,2.3288,0.974,0.019,"death"),
c("GO:0050673","epithelial cell proliferation",0.708,2.2111,0.952,0.023,"epithelial cell proliferation"),
c("GO:0090289","regulation of osteoclast proliferation",0.003,1.5768,0.882,0.403,"epithelial cell proliferation"),
c("GO:0050679","positive regulation of epithelial cell proliferation",0.313,2.4401,0.811,0.573,"epithelial cell proliferation"),
c("GO:0070661","leukocyte proliferation",0.556,1.9918,0.953,0.605,"epithelial cell proliferation"),
c("GO:0060352","cell adhesion molecule production",0.005,2.6861,0.946,0.027,"cell adhesion molecule production"),
c("GO:0008283","cell proliferation",4.075,2.1409,0.974,0.030,"cell proliferation"),
c("GO:0019835","cytolysis",0.043,1.7540,0.964,0.031,"cytolysis"),
c("GO:0045428","regulation of nitric oxide biosynthetic process",0.095,4.2218,0.826,0.033,"regulation of nitric oxide biosynthesis"),
c("GO:0006566","threonine metabolic process",0.010,3.1549,0.884,0.121,"regulation of nitric oxide biosynthesis"),
c("GO:0045787","positive regulation of cell cycle",0.253,2.0367,0.815,0.136,"regulation of nitric oxide biosynthesis"),
c("GO:0046209","nitric oxide metabolic process",0.147,2.7545,0.948,0.144,"regulation of nitric oxide biosynthesis"),
c("GO:0040017","positive regulation of locomotion",0.632,1.8193,0.881,0.161,"regulation of nitric oxide biosynthesis"),
c("GO:0005989","lactose biosynthetic process",0.006,1.5768,0.899,0.165,"regulation of nitric oxide biosynthesis"),
c("GO:0050823","peptide antigen stabilization",0.001,1.5768,0.910,0.183,"regulation of nitric oxide biosynthesis"),
c("GO:0002253","activation of immune response",1.043,1.6910,0.841,0.185,"regulation of nitric oxide biosynthesis"),
c("GO:0009896","positive regulation of catabolic process",0.386,4.1739,0.824,0.227,"regulation of nitric oxide biosynthesis"),
c("GO:0006022","aminoglycan metabolic process",0.332,2.4168,0.916,0.253,"regulation of nitric oxide biosynthesis"),
c("GO:0048522","positive regulation of cellular process",8.548,4.5528,0.814,0.253,"regulation of nitric oxide biosynthesis"),
c("GO:0009131","pyrimidine nucleoside monophosphate catabolic process",0.001,1.5768,0.886,0.277,"regulation of nitric oxide biosynthesis"),
c("GO:0002250","adaptive immune response",19.622,2.6055,0.883,0.304,"regulation of nitric oxide biosynthesis"),
c("GO:0051090","regulation of sequence-specific DNA binding transcription factor activity",0.562,2.3125,0.785,0.316,"regulation of nitric oxide biosynthesis"),
c("GO:0035505","positive regulation of myosin light chain kinase activity",0.001,1.5768,0.827,0.326,"regulation of nitric oxide biosynthesis"),
c("GO:0043006","activation of phospholipase A2 activity by calcium-mediated signaling",0.002,1.5768,0.825,0.328,"regulation of nitric oxide biosynthesis"),
c("GO:0042159","lipoprotein catabolic process",0.031,2.0097,0.911,0.344,"regulation of nitric oxide biosynthesis"),
c("GO:0045600","positive regulation of fat cell differentiation",0.084,1.7097,0.766,0.344,"regulation of nitric oxide biosynthesis"),
c("GO:0009893","positive regulation of metabolic process",5.415,3.0506,0.831,0.351,"regulation of nitric oxide biosynthesis"),
c("GO:0072529","pyrimidine-containing compound catabolic process",0.063,1.8236,0.881,0.363,"regulation of nitric oxide biosynthesis"),
c("GO:0097267","omega-hydroxylase P450 pathway",0.010,2.3925,0.901,0.375,"regulation of nitric oxide biosynthesis"),
c("GO:0071931","positive regulation of transcription involved in G1/S transition of mitotic cell cycle",0.002,1.5768,0.810,0.381,"regulation of nitric oxide biosynthesis"),
c("GO:0042339","keratan sulfate metabolic process",0.038,2.6162,0.867,0.395,"regulation of nitric oxide biosynthesis"),
c("GO:0035504","regulation of myosin light chain kinase activity",0.001,1.5768,0.854,0.405,"regulation of nitric oxide biosynthesis"),
c("GO:2000373","positive regulation of DNA topoisomerase (ATP-hydrolyzing) activity",0.002,1.5768,0.825,0.435,"regulation of nitric oxide biosynthesis"),
c("GO:0071044","histone mRNA catabolic process",0.016,1.6525,0.882,0.440,"regulation of nitric oxide biosynthesis"),
c("GO:0090207","regulation of triglyceride metabolic process",0.047,2.2684,0.841,0.444,"regulation of nitric oxide biosynthesis"),
c("GO:0051092","positive regulation of NF-kappaB transcription factor activity",0.194,2.4123,0.795,0.456,"regulation of nitric oxide biosynthesis"),
c("GO:0006357","regulation of transcription from RNA polymerase II promoter",3.684,1.9389,0.745,0.484,"regulation of nitric oxide biosynthesis"),
c("GO:0050822","peptide stabilization",0.001,1.5768,0.929,0.495,"regulation of nitric oxide biosynthesis"),
c("GO:0009894","regulation of catabolic process",2.662,1.9923,0.840,0.511,"regulation of nitric oxide biosynthesis"),
c("GO:0019438","aromatic compound biosynthetic process",13.512,1.6253,0.867,0.521,"regulation of nitric oxide biosynthesis"),
c("GO:0048711","positive regulation of astrocyte differentiation",0.018,1.6525,0.755,0.533,"regulation of nitric oxide biosynthesis"),
c("GO:0002252","immune effector process",20.305,1.8969,0.941,0.537,"regulation of nitric oxide biosynthesis"),
c("GO:0019694","alkanesulfonate metabolic process",0.010,1.5768,0.914,0.570,"regulation of nitric oxide biosynthesis"),
c("GO:0002456","T cell mediated immunity",19.064,2.1898,0.879,0.573,"regulation of nitric oxide biosynthesis"),
c("GO:0045930","negative regulation of mitotic cell cycle",0.059,1.7650,0.835,0.576,"regulation of nitric oxide biosynthesis"),
c("GO:0006536","glutamate metabolic process",0.049,2.0985,0.871,0.582,"regulation of nitric oxide biosynthesis"),
c("GO:0050776","regulation of immune response",20.571,2.5751,0.804,0.587,"regulation of nitric oxide biosynthesis"),
c("GO:0060212","negative regulation of nuclear-transcribed mRNA poly(A) tail shortening",0.001,1.5768,0.817,0.596,"regulation of nitric oxide biosynthesis"),
c("GO:0006955","immune response",27.347,2.1798,0.880,0.602,"regulation of nitric oxide biosynthesis"),
c("GO:0030163","protein catabolic process",1.538,1.6444,0.881,0.604,"regulation of nitric oxide biosynthesis"),
c("GO:0002682","regulation of immune system process",21.361,2.0205,0.867,0.610,"regulation of nitric oxide biosynthesis"),
c("GO:0006366","transcription from RNA polymerase II promoter",3.963,1.8044,0.840,0.613,"regulation of nitric oxide biosynthesis"),
c("GO:0031331","positive regulation of cellular catabolic process",0.268,2.7670,0.771,0.615,"regulation of nitric oxide biosynthesis"),
c("GO:0007095","mitotic G2 DNA damage checkpoint",0.030,1.7540,0.771,0.620,"regulation of nitric oxide biosynthesis"),
c("GO:0048584","positive regulation of response to stimulus",22.389,2.1403,0.802,0.634,"regulation of nitric oxide biosynthesis"),
c("GO:0010604","positive regulation of macromolecule metabolic process",4.917,2.7878,0.781,0.644,"regulation of nitric oxide biosynthesis"),
c("GO:0006256","UDP catabolic process",0.001,1.5768,0.873,0.644,"regulation of nitric oxide biosynthesis"),
c("GO:0045840","positive regulation of mitosis",0.070,1.6574,0.816,0.656,"regulation of nitric oxide biosynthesis"),
c("GO:0019518","L-threonine catabolic process to glycine",0.001,1.5768,0.882,0.666,"regulation of nitric oxide biosynthesis"),
c("GO:0018130","heterocycle biosynthetic process",13.553,1.6017,0.867,0.691,"regulation of nitric oxide biosynthesis"),
c("GO:0042340","keratan sulfate catabolic process",0.014,1.8713,0.857,0.692,"regulation of nitric oxide biosynthesis"),
c("GO:0009069","serine family amino acid metabolic process",0.164,1.7097,0.863,0.698,"regulation of nitric oxide biosynthesis"),
c("GO:0048773","erythrophore differentiation",0.003,1.5768,0.887,0.043,"erythrophore differentiation"),
c("GO:0010574","regulation of vascular endothelial growth factor production",0.068,3.2840,0.868,0.049,"regulation of vascular endothelial growth factor production"),
c("GO:0007519","skeletal muscle tissue development",0.480,2.9788,0.839,0.254,"regulation of vascular endothelial growth factor production"),
c("GO:0044706","multi-multicellular organism process",0.678,2.1838,0.866,0.303,"regulation of vascular endothelial growth factor production"),
c("GO:0007569","cell aging",0.203,1.6780,0.855,0.308,"regulation of vascular endothelial growth factor production"),
c("GO:1901233","negative regulation of convergent extension involved in axis elongation",0.001,1.5768,0.850,0.363,"regulation of vascular endothelial growth factor production"),
c("GO:0001754","eye photoreceptor cell differentiation",0.096,1.9519,0.820,0.393,"regulation of vascular endothelial growth factor production"),
c("GO:0021772","olfactory bulb development",0.082,1.7097,0.858,0.407,"regulation of vascular endothelial growth factor production"),
c("GO:0042662","negative regulation of mesodermal cell fate specification",0.009,1.5768,0.763,0.456,"regulation of vascular endothelial growth factor production"),
c("GO:0072358","cardiovascular system development",2.258,2.8996,0.826,0.458,"regulation of vascular endothelial growth factor production"),
c("GO:0048541","Peyer's patch development",0.040,1.6525,0.849,0.461,"regulation of vascular endothelial growth factor production"),
c("GO:0007567","parturition",0.036,1.8713,0.889,0.461,"regulation of vascular endothelial growth factor production"),
c("GO:1901740","negative regulation of myoblast fusion",0.001,1.5768,0.805,0.499,"regulation of vascular endothelial growth factor production"),
c("GO:0051817","modification of morphology or physiology of other organism involved in symbiotic interaction",0.098,1.7181,0.873,0.500,"regulation of vascular endothelial growth factor production"),
c("GO:0046530","photoreceptor cell differentiation",0.119,1.7097,0.827,0.506,"regulation of vascular endothelial growth factor production"),
c("GO:0035821","modification of morphology or physiology of other organism",0.116,1.6455,0.885,0.507,"regulation of vascular endothelial growth factor production"),
c("GO:0048646","anatomical structure formation involved in morphogenesis",2.581,2.3279,0.875,0.513,"regulation of vascular endothelial growth factor production"),
c("GO:0050793","regulation of developmental process",4.431,1.8225,0.819,0.523,"regulation of vascular endothelial growth factor production"),
c("GO:0021986","habenula development",0.006,1.5768,0.881,0.526,"regulation of vascular endothelial growth factor production"),
c("GO:0001756","somitogenesis",0.195,2.3645,0.854,0.534,"regulation of vascular endothelial growth factor production"),
c("GO:0007417","central nervous system development",2.238,2.7352,0.832,0.551,"regulation of vascular endothelial growth factor production"),
c("GO:0072359","circulatory system development",2.260,2.8996,0.841,0.552,"regulation of vascular endothelial growth factor production"),
c("GO:0021545","cranial nerve development",0.150,1.7650,0.864,0.556,"regulation of vascular endothelial growth factor production"),
c("GO:0045086","positive regulation of interleukin-2 biosynthetic process",0.024,1.6525,0.740,0.570,"regulation of vascular endothelial growth factor production"),
c("GO:0061053","somite development",0.224,2.1494,0.863,0.574,"regulation of vascular endothelial growth factor production"),
c("GO:0021538","epithalamus development",0.006,1.5768,0.881,0.577,"regulation of vascular endothelial growth factor production"),
c("GO:0010573","vascular endothelial growth factor production",0.071,3.1675,0.912,0.594,"regulation of vascular endothelial growth factor production"),
c("GO:0001315","age-dependent response to reactive oxygen species",0.006,1.5768,0.809,0.611,"regulation of vascular endothelial growth factor production"),
c("GO:0007399","nervous system development",4.932,1.8928,0.827,0.615,"regulation of vascular endothelial growth factor production"),
c("GO:0009888","tissue development",4.199,1.8389,0.875,0.618,"regulation of vascular endothelial growth factor production"),
c("GO:0019089","transmission of virus",0.076,1.5768,0.889,0.631,"regulation of vascular endothelial growth factor production"),
c("GO:0044707","single-multicellular organism process",15.092,3.1938,0.870,0.638,"regulation of vascular endothelial growth factor production"),
c("GO:0061298","retina vasculature development in camera-type eye",0.048,1.6525,0.862,0.649,"regulation of vascular endothelial growth factor production"),
c("GO:0090399","replicative senescence",0.030,1.7540,0.873,0.682,"regulation of vascular endothelial growth factor production"),
c("GO:0044782","cilium organization",0.384,2.0625,0.911,0.056,"cilium organization"),
c("GO:0007154","cell communication",17.535,2.6478,0.895,0.119,"cilium organization"),
c("GO:0017121","phospholipid scrambling",0.016,2.0097,0.915,0.256,"cilium organization"),
c("GO:0001976","neurological system process involved in regulation of systemic arterial blood pressure",0.046,1.6525,0.865,0.295,"cilium organization"),
c("GO:0007033","vacuole organization",0.138,1.7964,0.947,0.406,"cilium organization"),
c("GO:0003363","lamellipodium assembly involved in ameboidal cell migration",0.001,1.5768,0.908,0.413,"cilium organization"),
c("GO:0035543","positive regulation of SNARE complex assembly",0.001,1.5768,0.838,0.420,"cilium organization"),
c("GO:0097116","gephyrin clustering",0.006,1.5768,0.934,0.456,"cilium organization"),
c("GO:0003069","vasodilation by acetylcholine involved in regulation of systemic arterial blood pressure",0.003,1.5768,0.881,0.682,"cilium organization"),
c("GO:0035608","protein deglutamylation",0.011,3.1549,0.905,0.062,"protein deglutamylation"),
c("GO:0016485","protein processing",0.743,2.6655,0.910,0.210,"protein deglutamylation"),
c("GO:0042987","amyloid precursor protein catabolic process",0.054,1.6525,0.936,0.236,"protein deglutamylation"),
c("GO:0019538","protein metabolic process",17.009,2.9431,0.907,0.254,"protein deglutamylation"),
c("GO:0072376","protein activation cascade",0.335,2.2240,0.866,0.277,"protein deglutamylation"),
c("GO:0042157","lipoprotein metabolic process",0.387,2.3161,0.925,0.281,"protein deglutamylation"),
c("GO:0051604","protein maturation",0.786,2.6108,0.909,0.325,"protein deglutamylation"),
c("GO:0043170","macromolecule metabolic process",29.866,1.9454,0.930,0.325,"protein deglutamylation"),
c("GO:0036047","peptidyl-lysine demalonylation",0.002,1.5768,0.914,0.366,"protein deglutamylation"),
c("GO:0006508","proteolysis",4.713,2.4802,0.904,0.372,"protein deglutamylation"),
c("GO:0043412","macromolecule modification",10.189,1.8395,0.913,0.418,"protein deglutamylation"),
c("GO:0018193","peptidyl-amino acid modification",2.453,1.6194,0.869,0.435,"protein deglutamylation"),
c("GO:0018200","peptidyl-glutamic acid modification",0.064,2.4698,0.900,0.440,"protein deglutamylation"),
c("GO:0010467","gene expression",15.379,1.8598,0.908,0.465,"protein deglutamylation"),
c("GO:0036046","protein demalonylation",0.002,1.5768,0.917,0.571,"protein deglutamylation"),
c("GO:0036048","protein desuccinylation",0.002,1.5768,0.917,0.571,"protein deglutamylation"),
c("GO:0036049","peptidyl-lysine desuccinylation",0.002,1.5768,0.914,0.571,"protein deglutamylation"),
c("GO:0006464","cellular protein modification process",9.809,2.0419,0.847,0.695,"protein deglutamylation"),
c("GO:0006790","sulfur compound metabolic process",0.742,1.8091,0.930,0.084,"sulfur compound metabolism"),
c("GO:0048518","positive regulation of biological process",28.712,4.5850,0.906,0.085,"positive regulation of biological process"),
c("GO:0048519","negative regulation of biological process",8.588,1.9780,0.919,0.190,"positive regulation of biological process"),
c("GO:0048583","regulation of response to stimulus",26.518,2.4112,0.867,0.273,"positive regulation of biological process"),
c("GO:0006952","defense response",3.096,3.4437,0.862,0.087,"defense response"),
c("GO:0009607","response to biotic stimulus",1.599,3.0706,0.942,0.104,"defense response"),
c("GO:0009605","response to external stimulus",4.459,3.3872,0.935,0.120,"defense response"),
c("GO:0009719","response to endogenous stimulus",3.718,2.0110,0.937,0.124,"defense response"),
c("GO:0042221","response to chemical",8.684,3.7696,0.930,0.142,"defense response"),
c("GO:0006950","response to stress",8.191,2.7167,0.930,0.160,"defense response"),
c("GO:0051716","cellular response to stimulus",19.092,2.5498,0.886,0.193,"defense response"),
c("GO:0010768","negative regulation of transcription from RNA polymerase II promoter in response to UV-induced DNA damage",0.001,1.5768,0.777,0.309,"defense response"),
c("GO:0051866","general adaptation syndrome",0.006,1.5768,0.855,0.347,"defense response"),
c("GO:0002753","cytoplasmic pattern recognition receptor signaling pathway",0.079,3.3565,0.710,0.432,"defense response"),
c("GO:0016236","macroautophagy",0.138,2.2749,0.743,0.457,"defense response"),
c("GO:0071496","cellular response to external stimulus",0.549,1.9614,0.909,0.504,"defense response"),
c("GO:0006979","response to oxidative stress",0.874,3.3565,0.878,0.559,"defense response"),
c("GO:0002677","negative regulation of chronic inflammatory response",0.017,1.5768,0.788,0.561,"defense response"),
c("GO:0006954","inflammatory response",1.375,3.4089,0.847,0.592,"defense response"),
c("GO:0050847","progesterone receptor signaling pathway",0.008,2.1785,0.831,0.597,"defense response"),
c("GO:0072573","tolerance induction to lipopolysaccharide",0.002,1.5768,0.626,0.615,"defense response"),
c("GO:0080134","regulation of response to stress",1.961,2.2097,0.816,0.620,"defense response"),
c("GO:0002526","acute inflammatory response",0.259,2.8386,0.863,0.657,"defense response"),
c("GO:0033554","cellular response to stress",3.483,1.6546,0.787,0.672,"defense response"),
c("GO:0002673","regulation of acute inflammatory response",0.134,2.0640,0.792,0.673,"defense response"),
c("GO:0006958","complement activation, classical pathway",0.215,2.3645,0.761,0.680,"defense response"),
c("GO:0035872","nucleotide-binding domain, leucine rich repeat containing receptor signaling pathway",0.074,3.3565,0.805,0.690,"defense response"),
c("GO:0007626","locomotory behavior",0.515,1.8891,0.945,0.090,"locomotory behavior"),
c("GO:0060353","regulation of cell adhesion molecule production",0.002,1.5768,0.898,0.100,"regulation of cell adhesion molecule production"));

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
