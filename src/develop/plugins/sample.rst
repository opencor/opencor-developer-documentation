.. _develop_plugins_sample:

========
 Sample
========

The purpose of this plugin is to give other plugins access to a simple ``add()`` function, which can be used as follows:

.. code-block:: c++

   ...
   #include "sampleutilities.h"
   ...
   double addResult = Sample::add(3.0, 5.0);
   ...

File structure
--------------

::

  src
   ├─ sampleglobal.h
   ├─ sampleplugin.cpp
   ├─ sampleplugin.h
   ├─ sampleplugin.json
   ├─ sampleutilities.cpp
   └─ sampleutilities.h
  CMakeLists.txt

Category
--------

The first thing we need to do is to decide on the :ref:`category <develop_plugins_index_categories>` of our plugin.
Our plugin is aimed at helping people who want to learn how to write plugins for OpenCOR.
So, it should be in the `Sample <https://github.com/opencor/opencor/tree/master/src/plugins/sample/>`__ category.
This means that its code can be found under |Sample|_.

.. |Sample| replace:: ``[OpenCOR]/src/plugins/sample/Sample/``
.. _Sample: https://github.com/opencor/opencor/blob/master/src/plugins/sample/Sample/

Interfaces
----------

All our plugin does is to make its ``add()`` function available to other plugins, so there is no need for our plugin to interact with OpenCOR and, therefore, no need to implement any interface.

CMake project
-------------

To build our plugin, we need a |CMakeLists.txt|_ file (some information on CMake and plugins in OpenCOR can be found :ref:`here <develop_plugins_index_cmakeProject>`), which contents is:

.. code-block:: cmake
   :lineno-start: 1

   project(SamplePlugin)

   # Add the plugin

   add_plugin(Sample
       SOURCES
           ../../plugininfo.cpp

           src/sampleplugin.cpp
           src/sampleutilities.cpp
       HEADERS_MOC
           src/sampleplugin.h
       QT_MODULES
           Core
   )

.. |CMakeLists.txt| replace:: ``CMakeLists.txt``
.. _CMakeLists.txt: https://github.com/opencor/opencor/blob/master/src/plugins/sample/Sample/CMakeLists.txt

The first line specifies the name of the CMake project for our `Sample <https://github.com/opencor/opencor/tree/master/src/plugins/sample/Sample/>`__ plugin, i.e. ``SamplePlugin``.
Then, we have a call to the ``add_plugin()`` macro (line 5), which is defined in |common.cmake|_.
Different types of parameters are passed to it (``SOURCES``, ``HEADERS_MOC`` and ``QT_MODULES`` at lines 6, 11 and 13, respectively), followed by the parameters themselves.

.. |common.cmake| replace:: ``[OpenCOR]/cmake/common.cmake``
.. _common.cmake: https://github.com/opencor/opencor/blob/master/cmake/common.cmake

As for any plugin, our `Sample <https://github.com/opencor/opencor/tree/master/src/plugins/sample/Sample/>`__ plugin must reference |plugininfo.cpp|_ (line 7), so that it can provide some :ref:`basic information <develop_plugins_index_basicInformation>` about itself (more on this below).
``.cpp`` files that contain the plugin's implementation code must also be referenced (lines 9 and 10).
(Note that they start with ``sample``, i.e. the name of the plugin in lower case.
This convention is used throughout OpenCOR's code to ensure that there are no name clashes between plugins' files.)
All header files that define at least one class that uses the ``Q_OBJECT`` macro must also be referenced.
``sampleplugin.h`` is one such file (see below) and is therefore referenced (line 12).
Finally, OpenCOR uses the `Qt <https://www.qt.io/>`__ framework, so even though our `Sample <https://github.com/opencor/opencor/tree/master/src/plugins/sample/Sample/>`__ plugin is very minimal, we must still reference the ``Core`` module (line 14).

.. |plugininfo.cpp| replace:: ``[OpenCOR]/src/plugins/plugininfo.cpp``
.. _plugininfo.cpp: https://github.com/opencor/opencor/blob/master/src/plugins/plugininfo.cpp

Plugin information
------------------

We want our plugin to be recognisable by OpenCOR, which means that it must provide some :ref:`plugin information <develop_plugins_index_pluginInformation>`.
|sampleplugin.cpp|_ therefore contains a C function that is called by OpenCOR to retrieve some :ref:`basic information <develop_plugins_index_basicInformation>` about our plugin.
That function is declared in |sampleplugin.h|_, which is also where our :ref:`plugin class <develop_plugins_index_pluginClass>` is defined:

.. code-block:: c++
   :lineno-start: 28

   #include "plugininfo.h"

   //==============================================================================

   namespace OpenCOR {
   namespace Sample {

   //==============================================================================

   PLUGININFO_FUNC SamplePluginInfo();

   //==============================================================================

   class SamplePlugin : public QObject
   {
       Q_OBJECT

       Q_PLUGIN_METADATA(IID "OpenCOR.SamplePlugin" FILE "sampleplugin.json")
   };

   //==============================================================================

   }   // namespace Sample
   }   // namespace OpenCOR

.. |sampleplugin.cpp| replace:: ``sampleplugin.cpp``
.. _sampleplugin.cpp: https://github.com/opencor/opencor/blob/master/src/plugins/sample/Sample/src/sampleplugin.cpp

.. |sampleplugin.h| replace:: ``sampleplugin.h``
.. _sampleplugin.h: https://github.com/opencor/opencor/blob/master/src/plugins/sample/Sample/src/sampleplugin.h

We need to know about the data structure of our :ref:`basic information <develop_plugins_index_basicInformation>`, so we include |plugininfo.h|_ (line 28).
Then, we declare our C function (line 37).
Finally, we have the definition of our :ref:`plugin class <develop_plugins_index_pluginClass>` (lines 41-46).
The call to the ``Q_PLUGIN_METADATA()`` macro (line 45) requires to pass both an IID (``OpenCOR.SamplePlugin``) and the name of a `JSON <http://www.json.org/>`__ file (|sampleplugin.json|_).
As mentioned :ref:`here <develop_plugins_index_jsonFile>`, the JSON file simply references the name of our plugin class (``SamplePlugin``):

.. code-block:: json
   :lineno-start: 1

   {
       "Keys": [ "SamplePlugin" ]
   }

.. |plugininfo.h| replace:: ``plugininfo.h``
.. _plugininfo.h: https://github.com/opencor/opencor/blob/master/src/plugins/plugininfo.h

.. |sampleplugin.json| replace:: ``sampleplugin.json``
.. _sampleplugin.json: https://github.com/opencor/opencor/blob/master/src/plugins/sample/Sample/src/sampleplugin.json

Next, we have our |sampleplugin.cpp|_ file, which contents is:

.. code-block:: c++
   :lineno-start: 24

   #include "sampleplugin.h"

   //==============================================================================

   namespace OpenCOR {
   namespace Sample {

   //==============================================================================

   PLUGININFO_FUNC SamplePluginInfo()
   {
       Descriptions descriptions;

       descriptions.insert("en", QString::fromUtf8("a plugin that provides an addition function."));
       descriptions.insert("fr", QString::fromUtf8("une extension qui fournit une fonction d'addition."));

       return new PluginInfo(PluginInfo::Sample, false, false,
                             QStringList(),
                             descriptions);
   }

   //==============================================================================

   }   // namespace Sample
   }   // namespace OpenCOR

We start by including our header file (line 24).
Then, lines 33-43 contain the body of our C function.
The first thing it does is to create an instance of ``Descriptions`` on the stack (line 35).
This instance is used to provide a multilingual description of our plugin (here, both in English and in French; lines 37 and 38).
Then, it creates and returns an instance of ``PluginInfo`` on the heap (lines 40-42), which contains the :ref:`basic information <develop_plugins_index_basicInformation>` needed by OpenCOR to identify our plugin.
This includes our plugin's category (``PluginInfo::Sample``; line 40), whether it is selectable (``false``; line 40), whether it offers direct `CLI <https://en.wikipedia.org/wiki/Command-line_interface>`__ support (``false``; line 40), our plugin's direct dependencies (none, hence ``QStringList()``; line 41) and its multilingual description (``descriptions``; line 42).

**Note:** the returned ``PluginInfo`` object gets deleted by OpenCOR.
So, no need to worry about it.

Plugin specific
---------------

Finally, we need to deal with our plugin's ``add()`` function.
It is declared in |sampleutilities.h|_:

.. code-block:: c++
   :lineno-start: 28

   #include "sampleglobal.h"

   //==============================================================================

   namespace OpenCOR {
   namespace Sample {

   //==============================================================================

   double SAMPLE_EXPORT add(double pNb1, double pNb2);

   //==============================================================================

   }   // namespace Sample
   }   // namespace OpenCOR

.. |sampleutilities.h| replace:: ``sampleutilities.h``
.. _sampleutilities.h: https://github.com/opencor/opencor/blob/master/src/plugins/sample/Sample/src/sampleutilities.h

We start by including |sampleglobal.h|_ (line 28).
This header file defines the ``SAMPLE_EXPORT`` macro (click :ref:`here <develop_plugins_index_globalHeaderInformation>` for some information on plugins' global header file in OpenCOR), which we use to declare our plugin's ``add()`` function (line 37).

.. |sampleglobal.h| replace:: ``sampleglobal.h``
.. _sampleglobal.h: https://github.com/opencor/opencor/blob/master/src/plugins/sample/Sample/src/sampleglobal.h

The implementation our plugin's ``add()`` function can be found in |sampleutilities.cpp|_:

.. code-block:: c++
   :lineno-start: 24

   #include "sampleutilities.h"

   //==============================================================================

   namespace OpenCOR {
   namespace Sample {

   //==============================================================================

   double add(double pNb1, double pNb2)
   {
       // Return the sum of the two given numbers

       return pNb1+pNb2;
   }

   //==============================================================================

   }   // namespace Sample
   }   // namespace OpenCOR

.. |sampleutilities.cpp| replace:: ``sampleutilities.cpp``
.. _sampleutilities.cpp: https://github.com/opencor/opencor/blob/master/src/plugins/sample/Sample/src/sampleutilities.cpp

We start by including |sampleutilities.h|_ (line 24). Then, we have a straightforward implementation of our plugin's ``add()`` function (lines 33-38).
