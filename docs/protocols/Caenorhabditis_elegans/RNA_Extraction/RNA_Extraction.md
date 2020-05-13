# *C. elegans* Total RNA Extraction

## Materials

- M9
- RNase-free water
- Trizol
- Ice
- Liquid N2
- Heat block set to 37°C
- Vortexer
- RNase-free 1.5 mL tubes
- Eliminase or RNase Zap
- Chloroform
- Cold isopropanol
- 75% ethanol
- TE buffer (optional)
- Centrifuge cooled to 4°C

## Washing and Feeze-Cracking Worms

1. Grow up desired number of 10 cm plates for eventual RNA extraction. As a general estimate, each 10 cm plate of adult worms yields at least 10 ug of RNA. Scale accordingly across strains.

    **Example schedule for bleach-synchronized population**

      - **D1** pick 3 x 6 cm plates (5 worms/plate)
      - **D4** pick 3 x 10 cm plates (30-50 worms/plate)
      - **D8** Bleach gravid population from 10 cm plates (< 6 plates per tube). Expect ~5k embryos per 10 cm plate.
      - **D8** Combine, titer, and plate out 2k embryos per plate on 6 x 10 cm plates. You can usually plate out twice as many 10 cm plates as went into the bleach.
      - Monitor plates closely until intended developmental milestone(s) are reached.

        ```
        N2 estimates
        0 hrs (L1, not plated - straight from tubes)
        28 hrs (L2)
        35 hrs (L3)
        48 hrs (L4)
        60 hrs (Young Adults)
        70 hrs (Adults)
        ```  

    **Alternatively,** can chunk 3-6 x 10 cm plates and bleach gravid population (continue with D8 above).

    **For mixed population,** can chunk 3-6 x 10 cm plates and monitor until intended developmental milestone(s) are reached.    


2. When plates are ready, wash worms off of plates with M9 and pool by strain into nearly-filled 15 mL tubes of M9.

3. Let settle on ice for 1 hour and aspirate off M9.

4. Add 5 mL of fresh M9.

    a. Let settle on ice for ~15 minutes.

    b. Aspirate off M9.

    c. Tansfer worms to a 1.5 mL tube.

5. Add 1 mL M9.

    a. Spin on minicentrifuge or let settle on ice.

    b. Aspirate off M9.

6. Add 1 mL Trizol.

7. Flash-freeze each tube by dropping the tubes bottom first into liquid nitrogen, remove with a ladle or forceps.

8. Thaw tubes in a heat block set to 37°C.

9. *Repeat steps 7-8 four additional times.*

10. After the final thaw, vortex at 3200 for 30 seconds, then rest for 30 seconds.

11. *Repeat step 10 four additional times.*

    **Note:** Some debris may remain if isolating from eggs or processing mixed population; these will not interfere with RNA extraction yield or purity.

**Optional: store samples at -80°C or continue with protocol**

----

## RNA Isolation from Trizol Samples

1. Prior to RNA extraction, wipe down your working space, pipettes, and gloves with Eliminase or RNase Zap.

    **Note:** Ensure that your gloves remain RNase-free; if you touch a contaminated surface (i.e. skin, hair, other lab equipment) or breath on the gloves, they are no longer RNase-free. This procedure has been performed on personal bench tops, but the BSC will provide further sterility if RNA degradation or RNase contamination is a fear.

2. Add 200 μL chloroform per 1 mL Trizol.

    a. Shake vigorously for 15 seconds.

    b. Incubate at room temperature for 3 minutes.

    c. Centrifuge at 12,000 x g for 15 minutes at 4°C.

    d. Transfer the upper aqueous phase to a new, labelled RNase-free tube.

    **Note:** be very careful not to transfer any material from the interphase or lower organic phase; if you do, you will see the contamination in the 260:230 values measured by the NanoDrop. It is best to leave some aqueous phase behind in order to decrease the likelihood of transferring contaminants.

3. Add 500 μL cold isopropanol per 1 mL Trizol.

    a. Mix by inverting tubes 6 times.

    b. Incubate at room temperature for 10 minutes.

    **Note:** RNA yield may be increased by incubation at -20°C overnight; this step also provides a convenient pause point if necessary.

    c. Centrifuge at 12,000 x g for 10 minutes at 4°C; you should see a white or clear RNA pellet if you started with enough worms.

    d. Carefully remove supernatant; it is fine to leave some isopropanol behind (~5-10 μL) and remove it in the ensuing wash.

4. Add 1 mL cold 75% ethanol per 1 mL Trizol.

    a. Pulse vortex.

    b. Centrifuge at 7,500 x g for 5 minutes at 4°C.

    c. Remove the majority of the supernatant with a P1000; remove the remaining with a P20, being careful not to aspirate the RNA pellet but removing all the ethanol.

    d. Allow to air dry (with caps open) for 10 minutes in the BSC, ensure all ethanol is removed/evaporated.

5. Resuspend in 20-50 μL of TE buffer or RNase-free water by gently pipetting the pellet up and down.

    **Note:** 2-3 chunked plates should result in the extraction of 30-80 μg of RNA, depending on strain; choose your resuspension volume according to your desired final concentration.

6. Measure concentration and purity on the NanoDrop.

    **Note:** This protocol should results in **very pure** RNA, with 260:280 and 260:230 values ~ 1.9-2.2.

7. Optional, remove contaminating genomic DNA with the Turbo DNA-Free kit.

    **Note:** DNase treatment is required if planning on performing qPCR, and is strongly suggested in all other cases, especially if the 260:280 values from the NanoDrop reading was <2.

8. Perform a 1:5 dilution with a 1 μL sample and measure the concentration with Qubit RNA BR.

    **Note:** the linear range of the RNA BR assay is 1-1000 ng/μL, so use NanoDrop estimates to calculate the appropriate sample dilution. If performing qPCR or other quantitative measurements, the Qubit assay is significantly more reliable than the NanoDrop, and any downstream calculations should incorporate the Qubit measurement.

9. Dilute to a desired final concentration, aliquot if necessary, and store at -80°C.
