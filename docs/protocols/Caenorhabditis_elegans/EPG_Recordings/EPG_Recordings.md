# Screenchip Electropharyngeogram (EPG) Recordings


##Materials
-

##Protocol

##Advanced Preparations

1. Bleach synchronize worm strains following [Bleach_synchronization](../Bleach_synchronization/Bleach_synchronization.md) protocol.

2. Hatch on seeded 10cm NGM plates.

## Assay Protocol

1. When worms are young adults (~4 days after bleaching) they are the appropriate stage for the SC40 chips.

2. Wash and prepare worms:

      a. Wash worms from 10cm NGM plates into 1.5 mL eppendorf tubes using 1 mL of M9.

      b. Allow worms to settle for 2 minutes.

      c. Remove supernatant without disturbing the worm pellet.

      d. Add 1 mL of M9 and invert to wash worms.

      e. repeat b-d two more times, for a total of three M9 washes.

3. After the final wash, add desired drugs + 10mM serotonin and wait 20 minutes.

    **Notes:**
      - Serotonin: 10.6 mg into 5mL M9 for a final concentration of 10mM. Incubate worms in solution for 20 minutes to activate pharyngeal pumping. Use serotonin solution within 4 hours

      - Chips are reusable for up to 8 hours or 50-70 worms.
4. While waiting for drugs to take effect, set up the EPG device.

    a. Connect the computer, amplifier, and ScreenChip dock.

    - ensure cords are not touching each other to prevent background signal.

    b. Use syringe to pull fresh M9 into the chip and run the noise test.

    **Note:** Unplugging the microscope is important to decrease noise levels into an acceptable range. The outlet tubing can also  increase background noise, if this is a problem it can be unplugged from chip before recording if desired.

5. Loading worms into the chip:

    a. Place short tube into eppendorf tube containing treated worms.

    b. Gently pull back on the syringe until worms are observable in the waiting chamber.

      - Ensure there is always media in the eppendorf tube and refill as needed.

6. Recording worms:

    a. Save data to a folder labeled with the date [20190224], each strain needs its own sub-folder.

    b. Using the syringe gently pull back on the plunger and position a worm into the ecording channel.

    c. Once in position, eliminate background noise as necessary (ie unplug microscope, remove outlet tubing, check cords are not touching or moving), wait 30s then press the record button.

    d. Record for a total of 2 minutes ensuring worm does not drift from recording channel.

      - If drift occurs, stop the recording, reposition the worm and repeat step 6.c

    e. Use experiment notes to record worm orientation, drug concentration, strain, worm number, and initials.

    f. Remove worm from recording channel and position the worms following step 6.

7.  Clean-up:

      a. Discard any chips where worms are remaining or have been used to record more than 50 worms.

      b. Clean tubing by filling the syringe and passing 5 mL of M9 through into a waste container.

      c. Pass air through the tubing to help dry and remove any remaining debris.

  8. Analysis:

      a. Open NemAnalysis program

      b. Select folder to analyze

      c. Click Customize Analysis:

        - change setting by clicking individual File Settings and use brute force method.

        - Analysis parameter numbers may need to be adjusted for each experiment/strain/treatment.

      d. Allow program to analyze files, going through each file as they are completed to check for accuracy (ie high Signal to Noise ratio, worm orientation correlating to EPG peaks).

      e. Once finished analyzing a strain, export information to excel. Change “experiment date” and “analyzed date” to YYYYMMDD format

      f. Save excel document as a CSV file.
