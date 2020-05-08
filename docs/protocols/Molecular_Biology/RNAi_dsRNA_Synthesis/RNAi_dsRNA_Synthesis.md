# dsRNA Synthesis for RNAi

**General Note**: This protocol assumes you have already cloned a ~400-600 base pair fragment of gene target into pGEM-T. Use Primer3 to select primers for initial cloning efforts and use BLAST to check for potential off-target effects. Add T7 overhangs to working primers (5′ TAATACGACTCACTATAGGG 3′).

## Materials

  - MegaScript RNAi kit (Ambion AM1626)
  - Eliminase

## Adding T7 sites and scaling up the T7 template

1. Assemble master mix according to table below (this is for a single T7 reaction, scale as needed).

    |  Component | Volume |
    |--------------|---------|
    |Nuclease-free H<sub>2</sub>O | 16.25 µL |
    |Colorless GoTaq Buffer |5 µL |
    |10 mM dNTPs| 0.5 µL |
    |GoTaq Polymerase| 0.25 µL |
    |1:100 Plasmid Dilution| 1 µL |
    |Forward Primer (GSP+T7)| 1 µL |
    |Reverse Primer (GSP+T7)| 1 µL |
    |**TOTAL** | 25 µL |

2. Run with the following **Thermal Cycler Parameters**

    |  Time  | Temperature | Cycles |
    |--------|-------------|--------|
    | 2 min      | 95ºC        | 1      |
    | 30 s <br> 30 s <br> 1 min | 95°C <br> Tm (GSP) <br> 72°C | <br> 5 <br> <br>|
    | 30 s <br> 30 s <br> 1 min | 95°C <br> Tm (GSP+T7 -5 degrees) <br> 72°C | <br> 30 <br> <br>|
    | 5 min      | 72ºC        | 1      |
    | Hold       | 6°C         | 1      |

3. Pool PCR products for each target. Run 5 uL of product on an agarose gel to verify that the PCR worked.

## Purification and concentration of DNA
Concentrate the DNA using the Qiagen MinElute PCR Purification Kit

1. Add 5 volumes of Buffer PB to 1 volume of the PCR reaction and mix.

2. If total PCR reaction+Buffer exceeds 750 µL, split mixture accordingly and run through column in succession. Discard flow-through after each 750 µL sample has passed through column. (Max of four, 750 µL samples per column)

3. Add 750 µL Buffer PE to the MinElute columns and centrifuge for 1 minute. Discard flow-through.

4. Centrifuge the column for two minutes.

5. Place each MinElute column in a clean 1.5 mL microcentrifuge tube.

6. Add 10 µL of sterile water to the center of the MinElute column. Let the column stand for 1 min, and then centrifuge the column for one minute.

7. Measure DNA concentration using Nanodrop.

## T7 *in vitro* transcription (IVT)

1. Within the BSC, clean all barrier pipette tips and pipettes, gloves, and bench space with RNase Zap or Eliminase. Use the MegaScript RNAi kit to assemble the IVT reaction.

    |  Component | Volume |
    |--------------|---------|
    |Nuclease-free H<sub>2</sub>O | to 20 µL |
    |Template DNA (T7 PCR Product)|1 µg |
    |10X T7 Reaction Buffer| 2 µL |
    |ATP Solution| 2 µL |
    |CTP Solution| 2 µL |
    |GTP Solution| 2 µL |
    |UTP Solution| 2 µL |
    |T7 Enzyme Mix| 2 µL |
    |**TOTAL** | 20 µL |

    The reaction above is for a single 20 uL transcription reaction. **Each IVT reaction typically produces 100-200 µg of dsRNA**. Scale the reaction as needed.

2. Mix throughly by gently flicking the tube or pipette the mixture up and down, then briefly microcentrifuge to collect the reaction mixture at the bottom of the tube.

3. Incubate at 37ºC for 4 hr.

## Nuclease digestion to remove DNA and ssRNA

1. In the same tube as the IVT reaction, assemble the following digestion reaction in order to digest template DNA and any ssRNA (scale as needed):

    |  Component | Volume |
    |--------------|------|
    |dsRNA (from IVT rxn) | 20 µL |
    |Nuclease-free H2O|21 µL |
    |10X Digestion Buffer| 5 µL |
    |DNase I| 2 µL |
    |RNase| 2 µL |
    |**TOTAL**  | 50 µL |

2. Incubate at 37ºC for 1 hr.

## dsRNA Purification (cartridge or phenol/chloroform)

**Note:** You can use either the filter cartridges associated with this kit or carry out a phenol/chloroform purification.

1. Add the following to the previous 50 µL reaction (scale as needed):

    |  Component | Volume |
    |--------------|---------|
    |dsRNA (from digestion rxn) | 50 µL |
    |Nuclease-free H<sub>2</sub>O|150 µL |
    |Phenol| 100 µL |
    |Chloroform| 100 µL |
    | **TOTAL** | 400 µL |

2. Shake for 15 s. (don't allow foam to form).

3. Spin at 15,000 x g for 10 min. at 4ºC.

4. Transfer top phase (aqueous) to a new RNase-free tube.

    - **Note**: If previous reactions were successful, three layers should appear in the tube: the bottom layer is phenol, middle layer are proteins and lipids, and the top layer is chloroform. When taking tube out of centrifuge, if the top layer turns slightly opaque, that is a good indication.

5. To aqueous dsRNA, add ~500 µL isopropanol.

    - Optional: Add 0.1 volume of 3M sodium acetate and 2-3 volumes of cold 100% EtOH.

6. Place tube at -80ºC for 30 min.

7. Spin at 15,000 x g for 15 min. at 4ºC. You should see pellet after centrifugation (gelatinous blob).

8. Remove supernatant.

9. Wash pellet with ~600 µL cold 70% ethanol.

10. Spin at 5,000 x g for 5 min. at 4ºC.

    - Optional: Wash again if the pellet appears salty (white instead of clear).

11. Remove ~500 µL of supernatant, briefly spin in the minicentifuge. Use p20 remove as much of the supernatant as possible. Briefly spin in minicentrifuge. Use p2.5 remove the remaining supernatant.

12. You can use the p2.5 tip to move the gelatinous pellet up the side of the tube to facilitate drying and collect any remaining supernatant that is in tube.

13. Air dry, and resuspend in RNase-free water at a volume of 1-2 µg/µL.

    - **Note:** If pellet is at bottom etching = 100 µg. Visible pellets form when there is 5 µg of dsRNA. When you add water, the pellet will fall into solution and begin to zip around the top of the water until it goes into solution. If it doesn't, this means there may be too much salt in your RNA, or there is no RNA present.

14. Make a 1:10 dilution of original product by taking 1 µL dsRNA and 9 µL nuclease-free water. This will be used for a gel and to asses amount and purity of dsRNA using Nanodrop.

15. Record concentration, date, and initials on tube and store in the appropriate box in the -80ºC.
