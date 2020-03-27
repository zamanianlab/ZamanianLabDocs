# dsRNA Generation for RNAi Experiments

## Methods
**General Note**: An amplicon of 400-600 base pairs in length will need to be selected for gene of interest prior to starting this protocol. Using Primer3, select primers and add T7 overhangs (5′ TAATACGACTCACTATAGGG 3′). These primers will need to be validated prior to starting by using cDNA of life stage and species of interest.

### Adding T7 Sites and Scaling Up the T7 Template
1. Assemble master mix according to table below:

  |  Component | Volume |
  |--------------|---------|
  |Nuclease-free H2O | 16.25 µL |
  |Colorless GoTaq Buffer |5 µL |
  |10 mM dNTPs| 0.5 µL |
  |GoTaq Polymerase| 0.25 µL |
  |1:100 Plasmid Dilution| 1 µL |
  |Forward Primer (GSP+T7)| 1 µL |
  |Reverse Primer (GSP+T7)| 1 µL |
  |**TOTAL**| 25 µL |

  The above master mix is for a single T7 reaction. Scale as needed.

**Thermal Cycler Parameters**:    

[Stage 1] x1   
 	Step 1, 95C, 0:02:00  
  [Stage 2] x5  
 	  Step 1, 95C, 0:00:30  
   	Step 2, Tm (GSP), 0:00:30  
   	Step 3, 72C, 0:01:00  
	[Stage 3] x30   
   	Step 1, 95C, 0:00:30  
   	Step 2, Tm (GSP+T7 -5 degrees), 0:00:30  
 	Step 3, 72C, 0:01:00  
	[Stage 4] x1  
	Step 1, 72C, 0:05:00  
   	Step 2, 4C, ∞  


2. Pool PCR products for each target. Run a gel using 5 uL of product to verify that the PCR worked.

### Purification and Concentration of DNA
1. Concentrate the DNA using the Qiagen MinElute PCR Purification Kit (Room 230):

  - Add 5 volumes of Buffer PB to 1 volume of the PCR reaction and mix.

  - If total PCR reaction+Buffer exceeds 750 uL, split mixture accordingly and run through column in succession. Discard flow-through after each 750 uL sample has passed through column. (Max of four, 750 uL samples per column)

  - Add 750 uL Buffer PE to the MinElute columns and centrifuge for 1 minute. Discard flow-through.

  - Centrifuge the column for two minutes.

  - Place each MinElute column in a clean 1.5 microcentrifuge tube.

  - Add 10 uL of sterile water to the center of the MinElute column. Let the column stand for 1 min, and then centrifuge the column for one minute.
2. Analyze DNA concentration using Nanodrop

### T7 *in vitro* Transcription (IVT)
1. Within the BSC, clean all barrier pipette tips and pipettes, gloves, and bench space with RNase Zap or Eliminase (chemical shelf in Room 230). Use the MegaScript RNAi kit (-20C Stagmoose) to assemble the IVT reaction.

    |  Component | Volume |
    |--------------|---------|
    |Nuclease-free H2O | to 20 µL |
    |Template DNA (T7 PCR Product)|1 µg |
    |10X T7 Reaction Buffer| 2 µL |
    |ATP Solution| 2 µL |
    |CTP Solution| 2 µL |
    |GTP Solution| 2 µL |
    |UTP Solution| 2 µL |
    |T7 Enzyme Mix| 2 µL |
    |**TOTAL**| 20 µL |

    The reaction above is for a single 20 uL transcription reaction. Each IVT reaction produces 100-200 ug of dsRNA. Scale the reaction as needed.

2. Mix throughly by gently flicking the tube or pipette the mixture up and down, then briefly microcentrifuge to collect the reaction mixture at the bottom of the tube.

3. Incubate at 37C for 4 hrs.

### Nuclease Digestion to Remove DNA and ssRNA

1. In the same tube as the IVT reaction, assemble the following digestion reaction in order to digest template DNA and any ssRNA:

  |  Component | Volume |
|--------------|---------|
|dsRNA (from IVT rxn) | 20 µL |
|Nuclease-free H2O|21 µL |
|10X Digestion Buffer| 5 µL |
|DNase I| 2 µL |
|RNase| 2 µL |
|**TOTAL**| 50 µL |

  The reaction above is for a single digestion reaction. Scale the reaction as needed.

2. Incubate at 37C for 1 hr.

### Phenol/Chloroform Purification

1. Add the following to the previous 50 µL reaction:

  |  Component | Volume |
|--------------|---------|
|dsRNA (from digestion rxn) | 50 µL |
|Nuclease-free H2O|150 µL |
|Phenol| 100 µL |
|Chloroform| 100 µL |
|**TOTAL**| 400 µL |

  The reaction above is for a single phenol/chloroform purification reaction. Scale as needed.

2. Shake for 15 s. (don't allow foam to form).

3. Spin at 15,000 x g for 10 min. at 4C.

4. Transfer top phase (aqueous) to a new RNase-free tube.
  - **Note**: If previous reactions were highly successful, three layers should appear in the tube: the bottom layer is phenol, middle layer are proteins and lipids, and the top layer
is chloroform. When taking tube out of centrifuge, if the top layer turns slightly opaque, then it means you had a great reaction.

5. To aqueous dsRNA, add ~500 uL isopropanol.
  - Optional: Add 0.1 volume of 3M sodium acetate and 2-3 volumes of cold 100% EtOH.

6. Store at -80C for 30 min.

7. Spin at 15,000 x g for 15 min at 4C. You should see pellet after centrifugation (gelatinous blob).

8. Remove supernatant.

9. Wash pellet with ~600 uL cold 70% ethanol.

10. Spin at 5,000 x g for 5 min at 4C.
  - Optional: Wash again if the pellet appears salty (white instead of clear)

11. Remove ~500 uL of supernatant, briefly spin in the minicentifuge. Using p20 remove as much of the supernatant as possible. Briefly spin in mini-centrifuge. Using p2.5 remove the remaining supernatant.

12. You can use the p2.5 tip to move the gelatinous pellet up the side of the tube to facilitate drying and collect any remaining supernatant that is in tube.

13. Air dry, and resuspend in RNase-free water at a volume of 1-2 ug/µL.
  - Note: If pellet is at bottom etching = 100 ug. Visible pellets form when there is 5 ug of dsRNA. When you add water, the pellet will fall into solution and begin to zip around the top of the water until it goes into solution. If it doesn't, this means there may be too much salt in your RNA, or there is no RNA present.

14. Make a 1:10 dilution of original product by taking 1 uL dsRNA and 9 uL nuclease-free water. This will be used for a gel and to asses amount and purity of dsRNA using Nanodrop.

15. Record concentration, date, and initials on tube and place in the appropriate box located in the -80C (Mammoth).
