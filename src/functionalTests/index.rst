.. _functionalTests_index:

==================
 Functional tests
==================

Every new release of OpenCOR (be it a snapshot or an official release) should pass the following functional tests.

**Note:** please `let us know <http://localhost/contactUs.html>`_ if you think a particular functional test is missing from the list above.

Save / reload a file
--------------------

Check that a given view looks right for a given file when:

- The view **is** the active one in OpenCOR and:

  - The file is edited and saved **outside** of OpenCOR.
  - The file is edited and saved **in** OpenCOR (if applicable).

- The view **is not** the active one in OpenCOR and:

  - The file is edited and saved **outside** of OpenCOR.
  - The file is edited and saved **in** OpenCOR (if applicable).

Edit / save a SED-ML file / COMBINE archive
-------------------------------------------

Using the `Simulation Experiment <http://opencor.ws/user/plugins/simulation/SimulationExperimentView.html>`_ view, check that we can:

- SED-ML file:

  - "Save" / "Save as..." a (local) SED-ML file that references a **local** CellML file.
  - "Save" / "Save as..." a (local) SED-ML file that references a **remote** CellML file.
  - Export a **local** SED-ML file to a COMBINE archive.
  - Export a **remote** SED-ML file to a COMBINE archive.

- COMBINE archive:

  - "Save" / "Save as..." a (local) COMBINE archive.

All of this for both a CellML 1.0 file and a set of CellML 1.1 files.

CellML files
------------

- Problematic CellML models:

  - |definite_integral_model.cellml|_
  - |no_voi_model.cellml|_
  - |overconstrained_model.cellml|_
  - |underconstrained_model.cellml|_
  - |unsuitably_constrained_model.cellml|_

.. |definite_integral_model.cellml| replace:: ``[OpenCOR]/models/tests/cellml/definite_integral_model.cellml``
.. _definite_integral_model.cellml: https://github.com/opencor/opencor/blob/master/models/tests/cellml/definite_integral_model.cellml

.. |no_voi_model.cellml| replace:: ``[OpenCOR]/models/tests/cellml/no_voi_model.cellml``
.. _no_voi_model.cellml: https://github.com/opencor/opencor/blob/master/models/tests/cellml/no_voi_model.cellml

.. |overconstrained_model.cellml| replace:: ``[OpenCOR]/models/tests/cellml/overconstrained_model.cellml``
.. _overconstrained_model.cellml: https://github.com/opencor/opencor/blob/master/models/tests/cellml/overconstrained_model.cellml

.. |underconstrained_model.cellml| replace:: ``[OpenCOR]/models/tests/cellml/underconstrained_model.cellml``
.. _underconstrained_model.cellml: https://github.com/opencor/opencor/blob/master/models/tests/cellml/underconstrained_model.cellml

.. |unsuitably_constrained_model.cellml| replace:: ``[OpenCOR]/models/tests/cellml/unsuitably_constrained_model.cellml``
.. _unsuitably_constrained_model.cellml: https://github.com/opencor/opencor/blob/master/models/tests/cellml/unsuitably_constrained_model.cellml

- CellML 1.0 models:

  - |parabola_dae_model.cellml|_
  - |parabola_ode_model.cellml|_
  - |parabola_variant_dae_model.cellml|_
  - |simple_dae_model.cellml|_

.. |parabola_dae_model.cellml| replace:: ``[OpenCOR]/models/tests/cellml/parabola_dae_model.cellml``
.. _parabola_dae_model.cellml: https://github.com/opencor/opencor/blob/master/models/tests/cellml/parabola_dae_model.cellml

.. |parabola_ode_model.cellml| replace:: ``[OpenCOR]/models/tests/cellml/parabola_ode_model.cellml``
.. _parabola_ode_model.cellml: https://github.com/opencor/opencor/blob/master/models/tests/cellml/parabola_ode_model.cellml

.. |parabola_variant_dae_model.cellml| replace:: ``[OpenCOR]/models/tests/cellml/parabola_variant_dae_model.cellml``
.. _parabola_variant_dae_model.cellml: https://github.com/opencor/opencor/blob/master/models/tests/cellml/parabola_variant_dae_model.cellml

.. |simple_dae_model.cellml| replace:: ``[OpenCOR]/models/tests/cellml/simple_dae_model.cellml``
.. _simple_dae_model.cellml: https://github.com/opencor/opencor/blob/master/models/tests/cellml/simple_dae_model.cellml

- CellML 1.1 models:

  - |cellml_1_1/experiments/periodic-stimulus.xml|_

.. |cellml_1_1/experiments/periodic-stimulus.xml| replace:: ``[OpenCOR]/models/tests/cellml/cellml_1_1/experiments/periodic-stimulus.xml``
.. _cellml_1_1/experiments/periodic-stimulus.xml: https://github.com/opencor/opencor/blob/master/models/tests/cellml/cellml_1_1/experiments/periodic-stimulus.xml

SED-ML files
------------

- |noble_1962_local.sedml|_
- |noble_1962_remote.sedml|_
- |noble_1962_gL_time.sedml|_
- |noble_1962_iK_time.sedml|_
- |noble_1962_iK_V.sedml|_
- |noble_1962_time_gL.sedml|_
- |noble_1962_time_iK.sedml|_
- |noble_1962_time_time.sedml|_
- |noble_1962_time_V.sedml|_
- |noble_1962_V_iK.sedml|_
- |noble_1962_V_time.sedml|_

.. |noble_1962_local.sedml| replace:: ``[OpenCOR]/models/tests/sedml/noble_1962_local.sedml``
.. _noble_1962_local.sedml: https://github.com/opencor/opencor/blob/master/models/tests/sedml/noble_1962_local.sedml

.. |noble_1962_remote.sedml| replace:: ``[OpenCOR]/models/tests/sedml/noble_1962_remote.sedml``
.. _noble_1962_remote.sedml: https://github.com/opencor/opencor/blob/master/models/tests/sedml/noble_1962_remote.sedml

.. |noble_1962_gL_time.sedml| replace:: ``[OpenCOR]/models/tests/sedml/noble_1962_gL_time.sedml``
.. _noble_1962_gL_time.sedml: https://github.com/opencor/opencor/blob/master/models/tests/sedml/noble_1962_gL_time.sedml

.. |noble_1962_iK_time.sedml| replace:: ``[OpenCOR]/models/tests/sedml/noble_1962_iK_time.sedml``
.. _noble_1962_iK_time.sedml: https://github.com/opencor/opencor/blob/master/models/tests/sedml/noble_1962_iK_time.sedml

.. |noble_1962_iK_V.sedml| replace:: ``[OpenCOR]/models/tests/sedml/noble_1962_iK_V.sedml``
.. _noble_1962_iK_V.sedml: https://github.com/opencor/opencor/blob/master/models/tests/sedml/noble_1962_iK_V.sedml

.. |noble_1962_time_gL.sedml| replace:: ``[OpenCOR]/models/tests/sedml/noble_1962_time_gL.sedml``
.. _noble_1962_time_gL.sedml: https://github.com/opencor/opencor/blob/master/models/tests/sedml/noble_1962_time_gL.sedml

.. |noble_1962_time_iK.sedml| replace:: ``[OpenCOR]/models/tests/sedml/noble_1962_time_iK.sedml``
.. _noble_1962_time_iK.sedml: https://github.com/opencor/opencor/blob/master/models/tests/sedml/noble_1962_time_iK.sedml

.. |noble_1962_time_time.sedml| replace:: ``[OpenCOR]/models/tests/sedml/noble_1962_time_time.sedml``
.. _noble_1962_time_time.sedml: https://github.com/opencor/opencor/blob/master/models/tests/sedml/noble_1962_time_time.sedml

.. |noble_1962_time_V.sedml| replace:: ``[OpenCOR]/models/tests/sedml/noble_1962_time_V.sedml``
.. _noble_1962_time_V.sedml: https://github.com/opencor/opencor/blob/master/models/tests/sedml/noble_1962_time_V.sedml

.. |noble_1962_V_iK.sedml| replace:: ``[OpenCOR]/models/tests/sedml/noble_1962_V_iK.sedml``
.. _noble_1962_V_iK.sedml: https://github.com/opencor/opencor/blob/master/models/tests/sedml/noble_1962_V_iK.sedml

.. |noble_1962_V_time.sedml| replace:: ``[OpenCOR]/models/tests/sedml/noble_1962_V_time.sedml``
.. _noble_1962_V_time.sedml: https://github.com/opencor/opencor/blob/master/models/tests/sedml/noble_1962_V_time.sedml

COMBINE archives
----------------

- Problematic COMBINE archives:

  - |no_master_sedml_file.omex|_
  - |two_master_sedml_files.omex|_

.. |no_master_sedml_file.omex| replace:: ``[OpenCOR]/models/tests/combine/no_master_sedml_file.omex``
.. _no_master_sedml_file.omex: https://github.com/opencor/opencor/blob/master/models/tests/combine/no_master_sedml_file.omex

.. |two_master_sedml_files.omex| replace:: ``[OpenCOR]/models/tests/combine/two_master_sedml_files.omex``
.. _two_master_sedml_files.omex: https://github.com/opencor/opencor/blob/master/models/tests/combine/two_master_sedml_files.omex

- COMBINE archives:

  - |noble_1962.omex|_

.. |noble_1962.omex| replace:: ``[OpenCOR]/models/tests/combine/noble_1962.omex``
.. _noble_1962.omex: https://github.com/opencor/opencor/blob/master/models/tests/combine/noble_1962.omex

- COMBINE archives with DAE models:

  - |fink_slepchenko_moraru_watras_schaff_loew_2000v2.omex|_
  - |smith_chase_nokes_shaw_wake_2004.omex|_

.. |fink_slepchenko_moraru_watras_schaff_loew_2000v2.omex| replace:: ``[OpenCOR]/models/tests/combine/fink_slepchenko_moraru_watras_schaff_loew_2000v2.omex``
.. _fink_slepchenko_moraru_watras_schaff_loew_2000v2.omex: https://github.com/opencor/opencor/blob/master/models/tests/combine/fink_slepchenko_moraru_watras_schaff_loew_2000v2.omex

.. |smith_chase_nokes_shaw_wake_2004.omex| replace:: ``[OpenCOR]/models/tests/combine/smith_chase_nokes_shaw_wake_2004.omex``
.. _smith_chase_nokes_shaw_wake_2004.omex: https://github.com/opencor/opencor/blob/master/models/tests/combine/smith_chase_nokes_shaw_wake_2004.omex
