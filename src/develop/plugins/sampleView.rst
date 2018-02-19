.. _develop_plugins_sampleView:

=============
 Sample view
=============

The purpose of this plugin is to provide a view that gives some information about the current file.

File structure
--------------

::

  i18n
   └─ SampleView_fr.ts
  res
   └─ SampleView_i18n.qrc.in
  src
   ├─ sampleviewplugin.cpp
   ├─ sampleviewplugin.h
   ├─ sampleviewplugin.json
   ├─ sampleviewwidget.cpp
   ├─ sampleviewwidget.h
   └─ sampleviewwidget.ui
  CMakeLists.txt

Category
--------

Our plugin is part of the `Sample <https://github.com/opencor/opencor/tree/master/src/plugins/sample/>`__ category, which means that its code can be found under |SampleView|_.

.. |SampleView| replace:: ``[OpenCOR]/src/plugins/sample/SampleView/``
.. _SampleView: https://github.com/opencor/opencor/blob/master/src/plugins/sample/SampleView/

Interfaces
----------

We want our plugin to interact with OpenCOR.
This means that it needs to implement some interfaces (click :ref:`here <develop_plugins_index_interfaces>` for some information on interfaces).

More specifically, we want our plugin to be a view, so we need to implement both the `File handling <https://github.com/opencor/opencor/blob/master/src/plugins/filehandlinginterface.inl>`__, `Plugin <https://github.com/opencor/opencor/blob/master/src/plugins/plugininterface.inl>`__ and `View <https://github.com/opencor/opencor/blob/master/src/plugins/viewinterface.inl>`__ interfaces.
While we are at it, we might as well internationalise our plugin, in which case it means that we also need to implement the `Internationalisation <https://github.com/opencor/opencor/blob/master/src/plugins/i18ninterface.inl>`__ interface.
