.. _develop_plugins_sampleWindow:

===============
 Sample window
===============

The purpose of this plugin is to extend our :ref:`Sample <develop_plugins_sample>` plugin by making it possible for the user to add two numbers through a dockable window.

Prerequisites
-------------

- :ref:`Sample <develop_plugins_sample>` plugin

File structure
--------------

::

  i18n
   └─ SampleWindow_fr.ts
  res
   └─ SampleWindow_i18n.qrc.in
  src
   ├─ samplewindowplugin.cpp
   ├─ samplewindowplugin.h
   ├─ samplewindowplugin.json
   ├─ samplewindowwindow.cpp
   ├─ samplewindowwindow.h
   └─ samplewindowwindow.ui
  CMakeLists.txt

Category
--------

Our plugin is part of the `Sample <https://github.com/opencor/opencor/tree/master/src/plugins/sample/>`__ category, which means that its code can be found under |SampleWindow|_.

.. |SampleWindow| replace:: ``[OpenCOR]/src/plugins/sample/SampleWindow/``
.. _SampleWindow: https://github.com/opencor/opencor/blob/master/src/plugins/sample/SampleWindow/

Interfaces
----------

Unlike for the :ref:`Sample <develop_plugins_sample>` plugin, we want our plugin to interact with OpenCOR.
This means that it needs to implement some interfaces (click :ref:`here <develop_plugins_index_interfaces>` for some information on interfaces).

More specifically, we want our plugin to be a dockable window, so we need to implement both the `Plugin <https://github.com/opencor/opencor/blob/master/src/plugins/plugininterface.inl>`__ and `Window <https://github.com/opencor/opencor/blob/master/src/plugins/windowinterface.inl>`__ interfaces.
While we are at it, we might as well internationalise our plugin, in which case it means that we also need to implement the `Internationalisation <https://github.com/opencor/opencor/blob/master/src/plugins/i18ninterface.inl>`__ interface.

CMake project
-------------

As for the :ref:`Sample <develop_plugins_sample>` plugin, our plugin has a |CMakeLists.txt|_ file, which contents is:

.. code-block:: cmake
   :lineno-start: 1

   project(SampleWindowPlugin)

   # Add the plugin

   add_plugin(SampleWindow
       SOURCES
           ../../i18ninterface.cpp
           ../../plugininfo.cpp
           ../../plugininterface.cpp
           ../../windowinterface.cpp

           src/samplewindowplugin.cpp
           src/samplewindowwindow.cpp
       HEADERS_MOC
           src/samplewindowplugin.h
           src/samplewindowwindow.h
       UIS
           src/samplewindowwindow.ui
       PLUGINS
           Core
           Sample
   )

.. |CMakeLists.txt| replace:: ``CMakeLists.txt``
.. _CMakeLists.txt: https://github.com/opencor/opencor/blob/master/src/plugins/sample/SampleWindow/CMakeLists.txt

One of the interfaces our plugin implements comes with a ``.cpp`` file, so we reference it (lines 7, 9 and 10).
Then, our plugin needs both the `Core <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/>`__ and `Sample <https://github.com/opencor/opencor/tree/master/src/plugins/sample/Sample/>`__ plugins (the latter, to be able to use its ``add()`` function), so they are referenced (lines 20 and 21) using the ``PLUGINS`` keyword (line 19).
Our plugin comes with a dockable window, which is implemented using various files (lines 13, 16 and 18).
One of those files is a ``.ui`` file, which is referenced using the ``UIS`` keyword (line 17).

