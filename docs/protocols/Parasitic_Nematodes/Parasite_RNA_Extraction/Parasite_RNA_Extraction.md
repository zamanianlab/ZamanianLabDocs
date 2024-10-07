# Total Parasite RNA Extraction

### Materials
- Eliminase or RNase Zap  
- TRIzol LS (Ambion, #10296010)
- Safelock Tubes (Eppendorf, #022600044)
- Qiagen Stainless Steel 5 mm Beads (#69989)
- Nuclease-free Water
- Autoclaved MilliQ water
- Zymo Direct-zol RNA Miniprep (#R2051) (for option A)
- 100% Molecular Grade Ethanol (for option A)
- Chloroform (for option B)
- Isopropanol (for option B)

## Tissue storage

1. Treat working area with Eliminase or RNase Zap, acquire nuclease-free filtered tips, and  procure liquid nitrogen or dry ice.

2. Update the [Parasite Tissue and Nucleic Acid Inventory](https://docs.google.com/spreadsheets/d/1wJ3wzHmuTNRc_3RYjan3bp7rbBAsNrVvwJPJLilpmb8/edit#gid=0) with the tissues being prepared for storage and use cryolabels to label 1.5 mL tubes with the Sample ID. Be sure to include a lid label with stage and T###.

3. Prepare the tissue samples according to stage:

    |Stage | Wash Method | Ideal Quantity|
    |----------------------------| ------|----------------------------------------|
    |mf    |   Use RPMI-1640 and a [PD-10 column](../mf_filtration/mf_filtration.md) to filter the mf. Wash once with nuclease-free water (MilliQ). | 1 - 3 Million |
    |L3   | Wash L3 in a 15 mL conical tube using a small volume of nuclease-free water (MilliQ). Allow L3s to pellet by gravity.  |300+ |
    |Adult | Wash adult parasite cluster in a petri dish containing nuclease-free water (MilliQ).   | 30-50<sup>1</sup>    |  

    <sup>1</sup> Per TRIzol LS protocol, 50-100 mg tissue is recommended per 750 µL reagent. 

4. Transfer washed parasites to a nuclease-free 1.5 mL microcentrifuge tube, pellet the parasites, and remove as much of the supernatant as possible (100 µL max residual). 

5. Add 300 μL TRIzol LS.

6. Snap freeze in liquid nitrogen or dry ice. 

7. Store at -80°C in the Parasite Tissue storage box.

 **If time allows, perform RNA extraction immediately.**


## A. RNA extraction and purification

To be used if RNA integrity and purity are critical, or tissue input is limited (RNA-seq, qPCR).

1. Use new filter tips, clean work area in cell culture hood with Eliminase. Make a stock of 100% molecular grade ethanol (flammable cabinet).

2. Tissue lysis via TissueLyser

    - Clean TissueLyser LT and centrifuge with Eliminase prior to use.

    - Remove TRIzol samples from -80°C and thaw on ice.

    - Set up and label 2 mL Safelock tubes with one Qiagen smashing bead per tube.

    - Transfer thawed samples to Safelock tubes.

    - Lock tubes tightly, transfer to TissueLyser LT. Balance tubes. Lyse at 30/s for 3 min., then incubate for 3 min. on ice, then another 30/s. for 3 min.

    - Beads may not ‘bash’ using the system at 30/s., if no sound is heard, increase the speed to 36/s. for 10 seconds then drop it back to 30/s.

3. Zymo Column Purification

    - Add 400 μL 100% molecular grade ethanol and mix by pipette then transfer to Zymo spin column.

    - Follow Zymo kit instructions.

    - **Perform DNase treatment.**

    - Use fresh nuclease free water for elution of RNA, elute in minimum volume if required, otherwise perform two elutions for maximum yield.

    - If enough yield is expected for QC, remove 1 µL and store separately.

    - Snap freeze, label with appropriate sample ID & concentration. Store at -80°C.

    - QC by Nanodrop if yield is high (single adult, >200 L3) or by BioAnalyzer for low input samples (single cell preps, FACS prep).


## B. Alternative RNA extraction and purification protocol

To be used if RNA integrity & purity are less critical.

1. Use new filter tips, clean work area in cell culture hood with Eliminase. Make a stock of 100% molecular grade ethanol (flammable cabinet).

2. Cool centrifuge to 4°C.

3. Tissue lysis via TissueLyser:

    - Clean TissueLyser LT and centrifuge with Eliminase prior to use.

    - Remove TRIzol samples from -80°C and thaw on ice.

    - Set up and label 2 mL Safelock tubes with one Qiagen smashing bead per tube.

    - Transfer thawed samples to Safelock tubes.

    - Lock tubes tightly, transfer to TissueLyser LT. Balance tubes. Lyse at 30/s. for 3 min., then incubate for 3 mins. on ice, then another 30/s. for 3 mins.

    - Beads may not ‘bash’ using the system at 30/s, if no sound is heard, increase the speed to 36/s for 10 seconds then drop it back to 30/s.

4. Add 200 µL chloroform (flammable cabinet) per 0.8 m: TRIzol mix. Shake for 15 seconds, do not over shake just ensure the mix is opaque pink.

5. Spin at 12,000 rcf for 10 min. at 4°C.

6. Remove tubes carefully and pipette off top aqueous phase. Add 1 mL 100% isopropanol (flammable cabinet), mix and incubate at room temp for 10 minutes.

7. Spin at 15,000 rcf for 15 min. at 4°C.

8. Remove supernatant and wash in 70% ethanol (check for visible pellet).

9. Spin again for 5 min.

10. Remove ethanol with P1000, spin again, remove ethanol with p100, spin again, remove ethanol with P10, until no ethanol is visible. Air dry for 5 minutes.

11. Add 10-20 µL nuclease free water.

12. Nanodrop and gel QC checks should be performed. Expect a 260:280 reading of ~2.0. 1.8 means DNA contamination, >2.2 suggests salt contamination.

13. Snap freeze, label appropriately and store at -80°C.
