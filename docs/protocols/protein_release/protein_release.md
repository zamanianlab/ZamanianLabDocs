# Parasite Protein Release Experiments

## Generating conditioned-media

All protein release assays are performed in 24-well tissue culture plates. The following numbers of parasites should be used:

  |Stage | Number per Well |
  |------|--------|
  |Adult |1       |
  |L3    |300     |
  |mf    |125k    |

Experiments typically are performed using a 24 hour incubation, after which media is removed and stored at -20°C.

### Adults

1. Upon receipt, adult parasites must be washed in fresh RPMI 1640 and incubated overnight in fresh complete media (RPMI 1640 + 10% FBS + P/S).

2. After overnight incubation, prepare a 24-well plate with 500 μL of warm incomplete media (RPMI 1640 + P/S) per well (**NOTE**: do **not** use FBS, as this will be a contaminant when later quantifying protein release).

2. Using a probe, forceps, or similar device, sort parasites individually into wells, taking care not to injure the worms or damage the cuticle. Damaged/injured parasites should be discarded. Return the plates to the 37°C incubator; it is imperative to make every effort to not allow the parasites to cool to room temperature.

3. Prepare 2X drug stocks. Generally, this means making 200X stocks in water, DMSO, or ethanol, and then performing a 1:100 dilution in sufficient volume of incomplete media (>500 μL per replicate). Warm the 2X stocks to 37°C prior to adding to the parasites.

4. Prepare a spreadsheet (`N_plate_design.csv`), where N is the plate number, that outlines the drug, concentration, and replicate number for each well of the 24-well plates. Use the following syntax: `DRG_10-3_1` where DRG is a three digit abbreviation for the drug, 10-3 is the concentration (10-3 is equal to 10^-3) and 1 is the replicate number.

5. Note the time in your lab notebook, and then add 500 μL of each drug stock to the proper well. If the protein release experiment is to be linked to motility analysis, immediately record the plate after adding the drugs before moving on to the next plate (see the [WormViz](../wormviz/wormviz.md) protocol for the protocol for video recording adult parasites). Return the parasites to 37°C.

6. After 24 hour incubation, record the plates if desired and prepare 1.5 mL tubes for media storage. Each tube should be labeled with the plate number (i.e. BmAF1) and the well (i.e. A1). The date should be written on the side of the tube.

7. It is difficult to remove all of the conditioned media without incidentally aspirating the worms themselves, so it is recommended to manually remove the worms before aspirating conditioned media. Parasites can be disposed, stored for RNA-seq/qPCR analysis, or stored for general cloning procedures.

8. After removing worms, aspirate all of the conditioned media (there should be >850 μL remaining) and transfer to the correct labeled tubes.

9. Store the media in a labeled box (species, life stage, treatments, date) in -20°C.

### L3 and mf

- Much of the protocol is same for larval worms, with the following changes:

  - Larvae should begin treatment on the day of receipt. Wash worms with incomplete media as described:

    - L3s can be washed by "settling" - allowing worms to sink to the bottom at room temperature.

    - Mf can be washed with a [filtering protocol](../parasite_culture/mf_cleaning.md).

  - After washing, transfer the desired number of worms to a 24-well plate in 500 μL incomplete media per well.

  - Follow steps 3-9 in the adult protocol; remove worms in step 8 via settling of L3s or centrifuging mf for 2 minutes at 2000 x g.

## Quantification of protein release

### Protein purification

1. Remove samples from -20°C and thaw at room temperature.

2. While waiting for the samples to thaw, prepare a spreadsheet (`N_plate_design.csv`, where N is the plate number) that outlines the drug, concentration, and replicate number for each well of the 96-well plate that will be filled. Use the following syntax: `DATE_SP_LS_DRG_10-3_1` where DATE is the date of the experiment in YEARMTDY format (20200228), SP is the species (BM or BP), LS is the life stage (AM, AF, L3, MF), DRG is a three digit abbreviation for the drug, 10-3 is the concentration (10-3 is equal to 10^-3) and 1 is the replicate number. This spreadsheet should be stored in `ZamanianLab/Data/Airs_Experiments/ES_function/protein_release/YEARMTDY` where YEARMTDY is the date of the protein quantification assay.

3. Place an AcroPrep Advance filter plate 1 mL, 0.2 μm (<a href="https://us.vwr.com/store/product?keyword=97052-124" target="blank">VWR 97052-124</a>) on a **clean** 96-well deep well plate (<a href="https://us.vwr.com/store/product/24523767/vwr-96-well-deep-well-plates-polypropylene" target="blank">VWR 76210-518</a>).

2. Transfer 500 μL of the thawed conditioned media to a well of a AcroPrep filter plate.

3. Spin the samples at 1500 x *g* for 1 min.

4. Place an AcroPrep Advance filter plate 1 mL, Omega 3K MWCO (<a href="https://us.vwr.com/store/product?keyword=97052-124" target="blank">VWR 89135-696</a>) on a **used** 96-well deep well plate.



5. Using a 12-channel pipette, transfer the flow through from (2-3) to the new 3K filter plate. **NOTE**: after filtering the media through the 0.2 μm column, the samples will become very sensitive to contamination via dust or other debris falling in the wells. It is recommended to use foil to cover the plate when not handling, but the cover must be removed prior to centrifugation.

6. Spin the samples at 1500 x *g* for 40 min. After spinning, the majority of the media should have filtered through the 3K column. If not, spin again for 20 min.

8. Using a 12-channel pipette and a clean 50 mL trough, add 500 μL of PBS to each well, being sure not to allow dust or debris to fall into the wells.

9. Spin the samples at 1500 x *g* for 1 hr. Ensure that most of the 500 μL has flowed through the column. If it hasn't, spin again for 20 min.

10. Carefully tape a V-bottom 96-well plate (<a href="https://us.vwr.com/store/product/4949779/96-well-microtitration-plates-corning" target="blank">VWR 29442-402</a>) to the top of the 3K filter plate such that well A12 of the V-bottom plate is flush with well A1 of the 3K filter plate. **NOTE**: from this moment forward, all column numbers will be transposed in comparison to `plate_design.csv` until you re-adjust the orientation of the samples.

11. Spin the taped plates (with the V-bottom plate on the bottom) at 1500 x *g* for 2 min.

12. The hold-up volume for each well is inconsistent across the 3K filter plate and will need to be manually measured with a pipette. Each well of the V-bottom plate should have around 5-15 μL of sample. Store the plate on ice for immediate protein quantification or -20°C for later quantification.

### Protein quantification

We use the Pierce Micro BCA kit (<a href="https://us.vwr.com/store/product/11807723/piercetm-micro-bcatm-protein-assay-kit-and-reagents-thermo-scientific" target="blank">VWR PI23235</a>) for protein quantification. The manufacturer's [protocol](https://assets.thermofisher.com/TFS-Assets/LSG/manuals/MAN0011237_Micro_BCA_Protein_Asy_UG.pdf) will be followed and is transcribed below.

1. Pre-warm flat-bottom 96-well plates to 37°C - one plate for every 96 samples and an additional plate for the BSA standards.

2. Prepare BSA standards A-I according to Table 1, but divide all measurements by 10 (e.g. 450 μL of diluent and 50 μL BSA stock should be added to vial A). **NOTE**: after opening a glass new glass vial of BSA stock, transfer to a 1.5 mL tube and store at room temperature, where it is stable for up to 12 months.

3. Prepare the working reagent (WR) by creating a 25:24:1 mix of MA:MB:MC. You will need 150 μL of WR per sample, so calculate the final volume as [(Number of samples) + (9 standards * 2)] * 150; round up to the nearest 1 mL or calculate 10% additional to account for pipetting error.

4. Add the proper amount of PBS to each sample in the V-bottom plate such that each sample has a final volume of 150 μL.

5. Add 150 μL of WR to each well of the pre-warmed flat-bottom 96-well sample plate wells A1-B9 (18 wells in total) of the BSA standard plate and return to 37°C for 5 min.

6. Add 150 μL of each BSA standard to the proper well of the flat-bottom standards plate with WR.

7. Working quickly with a 12-channel pipette, transfer the 150 μL sample to the flat-bottom sample plate with WR. **NOTE**: if desired, this step is your opportunity to transpose the samples so that the BCA assay plate is loaded in the same orientation as `plate_design.csv`.

8. Affix adhesive film to the top of the plate and ensure it is completely sealed. Mix well on a plate shaker or vortexer.

9. Return the plate to 37°C and incubate for 2 hr.

10. During the incubation, create a new spreadsheet ()`N_bsa_standards.csv`, where N is the plate number) with the final BSA concentrations given in Table 1 of the Pierce Micro BSA manual. **NOTE**: there exists a template file in `ZamanianLab/Data/Airs_Experiments/ES_function/protein_release/bca_templates` that can be used if you correctly followed step 5.

11. Before the 2 hr. incubation is complete, boot up the Windows XP virtual environment on the Yoshino PC.

12. Turn on the plate reader and open the Revolution software.

13. Measure the plate with the Revolution software. **NOTE**: all data analysis, including drawing the standard curve, will be performed in R, so setting up the plate design in Revolution is not a priority.

14. Export the data as a spreadsheet, take a photo of the results, or otherwise ensure the measured concentrations are stored in a convenient location. **NOTE**: Revolution doesn't make it trivial to store the data from multiple plates, so make sure you have recorded the results of one plate before measuring a second plate.

15. Record the measurements in the proper Box folder in spreadsheets entitled `N_sample_data.csv` and `N_standard_data.csv`.

16. Fit the sample data to a standard curve using a best-fit polynomial equation
