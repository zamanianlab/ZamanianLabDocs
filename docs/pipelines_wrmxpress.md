# wrmXpress deployment

We have developed a software suite that analyzes worm imaging data generated on an ImageXpress high-content imager. The suite is composed of multiple bespoke modules that can be mixed and matched with pipelines developed in [CellProfiler](https://cellprofiler.org). The software can be deployed on a local machine or distributed on a high-performance or high-throughput computing network. More details can be found at the [wrmXpress GitHub repository](https://github.com/zamanianlab/wrmXpress).

The following contains a step-by-step protocol that is specific to Zamanian lab analytical pipelines deployed at the [Center for High-Throughput Computing (CHTC)](https://chtc.cs.wisc.edu/). Prerequisites include generating and exporting imaging data to Research Drive, transferring it to the `input/` directory of `staging/` on the CHTC, as well as uploading experimental metadata to the `metadata/` directory of `staging/`. The following links may be helpful:

- For full ImageXpress protocols, see our comprehensive [documentation](https://docs.google.com/document/d/1Gn4Ns4rJpdXaT5ZUF95xJILb24OojShKfQ0yHgHRQaM/edit#heading=h.s6zsphc56jc)
- For generating metadata, see the [Metadata](https://docs.google.com/document/d/1wxpg-AwJdTZxYi0eYovo2m6eeYbGn_KHd9zKrpYAeSA/edit#heading=h.uy3cjpbzggv) heading of the documentation
- For instructions on transferring data and metadata to the CHTC, see the Globus section (1A) of our [Server Pipelines](pipelines_server.md) page

## Preparing to submit wrmXpress jobs

To submit a job, the required imaging data and metadata must be uploading to the `staging/` directory of the CHTC. Once data is staged, follow the protocol below.

1. For each plate, fill out a YAML file that dictates the job's parameters. Use the [template](https://github.com/zamanianlab/wrmXpress/blob/main/local_env/parameters_template.yml) found in the GibHub repo. A thorough explanation of each parameter can be found at the repo's [homepage](https://github.com/zamanianlab/wrmXpress). Edit the YAML file with a text editor (e.g., Sublime, TextEdit, Atom, etc.).

2. Save the file(s) to your computer. Name each parameters file with the plate name (e.g., 20211013-p04-NJW_932.yml). Each plate that you plan to analyze must have its own YAML file (even if the parameters are the same for each plate in the batch).

3. Upload the YAML file(s) to your home directory of the submit2 server. It is probably easiest to use an SFTP client (e.g, Transmit, FileZilla, CyberDuck), but you can also use Globus or the `scp` command on the command line.

4. Create a file called `plate_list.txt` and include the plate name of each plate in the batch on a separate line. Upload this file to the home directory of the submit2 server.

    **Note:** If you already have a `plate_list.txt` file in your home directory, you can also choose to edit this in the terminal using `vim` or `nano`.

## Submitting wrmXpress jobs

5. SSH into the submit2 server and verify that the home directory includes a YAML file for each plate and an updated `plate_list.txt` file.

6. Clone (or pull) the chtc-submit repo (`git clone https://github.com/zamanianlab/chtc-submit.git`).

7. Edit `chtc-submit/imgproc/wrmXpress.sub` to ensure you are requesting the correct number of CPUs and amount of RAM and disc space. Do not push these changes back to the remote chtc-submit repo.

8. Submit the job(s) by running the command `condor_submit chtc-submit/imgproc/wrmXpress.sub script=chtc-submit/imgproc/wrmXpress.sh`.

    If everything went correctly, you should see a notice that says the jobs have been submitted. The number of jobs submitted corresponds to the number of plates in `plate_list.txt`.

# wrmXpress errors

So far, not all module combinations have been tested, and there are likely new experimental designs (e.g., wavelength/site combinations)  that may result in bugs without further testing and development. If you run into a bug, please submit an [Issue](https://github.com/zamanianlab/wrmXpress/issues) to the wrmXpress repo. An issue template is provided. YAML, .err, .out, and .log files will be required. Debugging will not begin until an adequate Issue has been filed.

# wrmXpress development

## Adding custom Python modules

wrmXpress was designed to be extensible by other users. Modules can be developed in Python and invoked on a well-by-well basis. Development of these modules likely requires a strong working knowledge of Python, including image processing libraries such as [opencv](https://opencv.org), [scikit-image](https://scikit-image.org), [matplotlib](https://matplotlib.org), [numpy](https://numpy.org), [pillow](https://pillow.readthedocs.io/en/stable/), and [scipy](https://scipy.org).

## Adding custom CellProfiler pipelines

A more immediate option for wrmXpress development that does not require Python expertise is through CellProfiler, which is written in Python but enables pipeline development through a GUI. A few general guidelines will allow for seamless integration of new CellProfiler pipelines into the wrmXpress wrapper.

1. Start a new project by opening and editing the [template CP project](https://github.com/zamanianlab/wrmXpress/blob/main/local_env/cp_pipelines/template.cpproj) that can be found in the wrmXpress repo (in `local_env/cp_pipelines/template.cpproj`).

2. Create a folder on your local desktop entitled `temp_root/`. In Output Settings (bottom left hand corner of the CP window), change the Default Input and Output folder to `/Users/{user}/Desktop/temp_root`, where `{user}` is the username on your machine.

3. To run in headless mode (on a server), the pipeline will not be able to use Images, Metadata, NamesAndTypes, or Groups. Instead, these will need to be populated with the LoadData module. However, in the development and testing phase, remove the LoadData modules and drag-and-drop a subset of test images into the Images pane.

4. Also drag-and-drop [`well_mask.png`](https://github.com/zamanianlab/wrmXpress/blob/main/cp_pipelines/masks/well_mask.png) into the Images pane.

5. In Metadata, select Yes for "Extract metadata?"

    - Insert the following regular expression: `^(?P<Date>.*)-(?P<Plate>p[0-9]{2,3})-(?P<Researcher>[A-Z]{2,3})_(?P<Well>[A-Z][0-9]{2})` and click Update. The Date, Plate, Researcher, and Well should populate as new columns.

6. In NamesAndTypes, change "Assign an name to" "Images matching rules"

    - Set "Select the rule criteria" to File Does Contain NJW (or the researcher initials)

    - Set "Name to assign to these images" to "RawImage"

    - Click Update and confirm that the rule worked

7. Click, "Add a single image"

    - Browse for the image location and select `well_mask.png`

    - Set Name to assign this image" to "WellMask"

    - Set "Select the image type" to "Binary mask"

    - Click Update, the table should now have a column named RawImage and WellMask

8. The CellProfiler GUI is now ready to add modules and test them on your set of images.

9. If using Worm Toolbox modules, you will need to have a local copy of [`WheelerAdultTrainingSet.xml`](https://github.com/zamanianlab/wrmXpress/blob/main/cp_pipelines/worm_models/WheelerAdultTrainingSet.xml). In the modules UntangleWorms or StraightenWorms, direct the "Training set file location" to this XML file. This path will need to be changed later.

10. For the ExportToSpreadsheet module, you probably do not want to deviate greatly from the parameters given in the template. The "Output file location" must be "Elsewhere" and "output/data/". Set both "Export all measurement types?" and "Use the object name for the file name?" to "No." In "File name," left click to select metadata attributes. The filename should follow the convention DATE-PLATE-RESEARCHER_{object}_data.csv where {object} is the name of the object that was measured. If this convention is not followed, the default R script to tidy and export the data will not work correctly.

11. In the SaveImages modules, set "Select method for constructing file names" to "Single name". Set "Enter single file name" to DATE-PLATE-RESEARCHER-WELL. Set the "Output file location" to "Elsewhere..." and "output/{image}" where {image} is the name of the image that you're saving (e.g., straightenedworms).

12. When the pipeline has been tested and validated, click File > Export > Image Set Listing... Set the file name to "image_paths_{pipeline}.csv" where {pipeline} is the name that you plan to use for the pipeline.

13. For running on the CHTC, this CSV will need to be automatically generated based on the plate data transferred into the `input/` directory of the execute node. Consult the R scripts in `wrmXpress/scripts/cp/` for guidance. Use the column names in the CSV generated in step 12 as the guide for the column names in the CSV generated by the R script. **These names must be identical, otherwise the pipeline will not work.** Save the R script as `generate_filelist_{pipeline}.R` where `{pipeline}` is the name of the pipeline.

14. In CellProfiler, add the LoadData module.

    - Set the "Input data file location" to "Elswhere..." and "input/". Set the name of the file to "image_paths_{pipeline}.csv".

    - Once LoadData has been added, you will no longer be able to test the pipeline.

15. Click File > Export > Pipeline... Choose the pipeline name and save it to `wrmXpress/cp_pipelines/pipelines`.

16. Open the newly saved pipeline file in a text editor.

    - Check the pipeline modules to ensure it contains no paths that are local to your computer.

    - Check that the path to the worm models in UntangleWorms and StraightenWorms is set to `Training set file location:Default Input Folder sub-folder|wrmXpress/cp_pipelines/worm_models`.

    - Consult other pipelines to ensure conformity. Even the slightest deviation from the established template will result in job errors.

17. Edit `wrmXpress/local_env/parameters_template.yml` in a text editor.

    - Under `cellprofiler: pipeline:` add the name of the new pipline.

18. Push the wrmXpress repo with the newly added pipeline, R script, and the updated template YAML file.

19. Test the pipeline by following the instructions in [wrmXpress deployment](#wrmXpress-development). A properly developed pipelin will result in an output folder that includes a `data/` directory with `*._data.csv` and `*._tidy.csv` files, and output images saved to the directory that you provided in step 11.
