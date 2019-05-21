.. _develop_plugins_sampleWindow:

===============
 Sample window
===============

The purpose of this plugin is to extend our :ref:`Sample <develop_plugins_sample>` plugin by making it possible for the user to add two numbers through a dockable window.

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
This means that it needs to implement some :ref:`interfaces <develop_plugins_index_interfaces>`.

More specifically, we want our plugin to be a dockable window, so we need to implement both the `Plugin <https://github.com/opencor/opencor/blob/master/src/plugins/plugininterface.inl>`__ and `Window <https://github.com/opencor/opencor/blob/master/src/plugins/windowinterface.inl>`__ interfaces.
While we are at it, we might also internationalise our plugin, which means also implementing the `Internationalisation <https://github.com/opencor/opencor/blob/master/src/plugins/i18ninterface.inl>`__ interface.

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

The interfaces our plugin implements come with a ``.cpp`` file, so we reference them (lines 7, 9 and 10).
Then, our plugin needs both the `Core <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/>`__ and `Sample <https://github.com/opencor/opencor/tree/master/src/plugins/sample/Sample/>`__ plugins (the latter, to be able to use its ``add()`` function), so they are referenced (lines 20 and 21) using the ``PLUGINS`` keyword (line 19).
Our plugin comes with a dockable window, which is implemented using various files (lines 13, 16 and 18).
One of those files is a ``.ui`` file, which is referenced using the ``UIS`` keyword (line 17).

Plugin information
------------------

Our :ref:`plugin information <develop_plugins_index_pluginInformation>` can be found in |samplewindowplugin.cpp|_, |samplewindowplugin.h|_ and |samplewindowplugin.json|_. Starting with |samplewindowplugin.h|_, its contents is:

.. code-block:: c++
   :lineno-start: 28

   #include "i18ninterface.h"
   #include "plugininfo.h"
   #include "plugininterface.h"
   #include "windowinterface.h"

   //==============================================================================

   namespace OpenCOR {
   namespace SampleWindow {

   //==============================================================================

   PLUGININFO_FUNC SampleWindowPluginInfo();

   //==============================================================================

   class SampleWindowWindow;

   //==============================================================================

   class SampleWindowPlugin : public QObject, public I18nInterface,
                              public PluginInterface, public WindowInterface
   {
       Q_OBJECT

       Q_PLUGIN_METADATA(IID "OpenCOR.SampleWindowPlugin" FILE "samplewindowplugin.json")

       Q_INTERFACES(OpenCOR::I18nInterface)
       Q_INTERFACES(OpenCOR::PluginInterface)
       Q_INTERFACES(OpenCOR::WindowInterface)

   public:
   #include "i18ninterface.inl"
   #include "plugininterface.inl"
   #include "windowinterface.inl"

   private:
       QAction *mSampleWindowAction;

       SampleWindowWindow *mSampleWindowWindow;
   };

   //==============================================================================

   } // namespace SampleWindow
   } // namespace OpenCOR

.. |samplewindowplugin.cpp| replace:: ``samplewindowplugin.cpp``
.. _samplewindowplugin.cpp: https://github.com/opencor/opencor/blob/master/src/plugins/sample/SampleWindow/src/samplewindowplugin.cpp

.. |samplewindowplugin.h| replace:: ``samplewindowplugin.h``
.. _samplewindowplugin.h: https://github.com/opencor/opencor/blob/master/src/plugins/sample/SampleWindow/src/samplewindowplugin.h

.. |samplewindowplugin.json| replace:: ``samplewindowplugin.json``
.. _samplewindowplugin.json: https://github.com/opencor/opencor/blob/master/src/plugins/sample/SampleWindow/src/samplewindowplugin.json

As mentioned above, our plugin implements some interfaces, which means that their header file is included (lines 28, 30 and 31).
It also means that our plugin class inherits from those interfaces (lines 48 and 49), as well as makes calls to the ``Q_INTERFACES()`` macro to let `Qt <https://www.qt.io/>`__ know which interfaces it implements (lines 55-57).
Finally, we include the inline files (lines 60-62) that declare various methods that must be implemented by our plugin (see :ref:`below <develop_plugins_sampleWindow_interfacesImplementation>`).
(The rest of the class definition is specific to our plugin and is discussed :ref:`below <develop_plugins_sampleWindow_pluginSpecific>`.)

The C function that is used by OpenCOR to retrieve some :ref:`basic information <develop_plugins_index_basicInformation>` about our plugin can be found in |samplewindowplugin.cpp|_:

.. code-block:: c++
   :lineno-start: 39

   PLUGININFO_FUNC SampleWindowPluginInfo()
   {
       Descriptions descriptions;

       descriptions.insert("en", QString::fromUtf8("a plugin that provides an addition window."));
       descriptions.insert("fr", QString::fromUtf8("une extension qui fournit une fenêtre d'addition."));

       return new PluginInfo(PluginInfo::Category::Sample, true, false,
                             QStringList() << "Core" << "Sample",
                             descriptions);
   }

As can be seen, our plugin is selectable by the user, but it does not offer `CLI <https://en.wikipedia.org/wiki/Command-line_interface>`__ support (line 46).
It also has a direct dependency on both the `Core <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/>`__ and `Sample <https://github.com/opencor/opencor/tree/master/src/plugins/sample/Sample/>`__ plugins (line 47).

.. _develop_plugins_sampleWindow_interfacesImplementation:

Interfaces implementation
-------------------------

The implementation of the interfaces' various methods can be found in |samplewindowplugin.cpp|_.
The methods are grouped by interface and are ordered alphabetically.

We start with the `Internationalisation <https://github.com/opencor/opencor/blob/master/src/plugins/i18ninterface.inl>`__ interface:

.. code-block:: c++
   :lineno-start: 51

   //==============================================================================
   // I18n interface
   //==============================================================================

   void SampleWindowPlugin::retranslateUi()
   {
       // Retranslate our Sample window action

       retranslateAction(mSampleWindowAction,
                         tr("Sample"),
                         tr("Show/hide the Sample window"));
   }

   //==============================================================================

All that we need to do is (re)translate ``mSampleWindowAction`` with the actual (French) translations in |SampleWindow_fr.ts|_ (together with some other translations needed :ref:`below <develop_plugins_sampleWindow_pluginSpecific>`).

.. |SampleWindow_fr.ts| replace:: ``SampleWindow_fr.ts``
.. _SampleWindow_fr.ts: https://github.com/opencor/opencor/tree/master/src/plugins/sample/SampleWindow/i18n/SampleWindow_fr.ts

Next, we have the `Plugin <https://github.com/opencor/opencor/blob/master/src/plugins/plugininterface.inl>`__ interface:

.. code-block:: c++
   :lineno-start: 64

   //==============================================================================
   // Plugin interface
   //==============================================================================

   bool SampleWindowPlugin::definesPluginInterfaces()
   {
       // We don't handle this interface...

       return false;
   }

   //==============================================================================

   bool SampleWindowPlugin::pluginInterfacesOk(const QString &pFileName,
                                               QObject *pInstance)
   {
       Q_UNUSED(pFileName)
       Q_UNUSED(pInstance)

       // We don't handle this interface...

       return false;
   }

   //==============================================================================

   void SampleWindowPlugin::initializePlugin()
   {
       // Create an action to show/hide our Sample window

       mSampleWindowAction = Core::newAction(true, Core::mainWindow());

       // Create our Sample window

       mSampleWindowWindow = new SampleWindowWindow(Core::mainWindow());
   }

   //==============================================================================

   void SampleWindowPlugin::finalizePlugin()
   {
       // We don't handle this interface...
   }

   //==============================================================================

   void SampleWindowPlugin::pluginsInitialized(const Plugins &pLoadedPlugins)
   {
       Q_UNUSED(pLoadedPlugins)

       // We don't handle this interface...
   }

   //==============================================================================

   void SampleWindowPlugin::loadSettings(QSettings &pSettings)
   {
       Q_UNUSED(pSettings)

       // We don't handle this interface...
   }

   //==============================================================================

   void SampleWindowPlugin::saveSettings(QSettings &pSettings) const
   {
       Q_UNUSED(pSettings)

       // We don't handle this interface...
   }

   //==============================================================================

   void SampleWindowPlugin::handleUrl(const QUrl &pUrl)
   {
       Q_UNUSED(pUrl)

       // We don't handle this interface...
   }

   //==============================================================================

The only method of interest to our plugin is ``initializePlugin()`` (lines 90-99), which is where we initialise both ``mSampleWindowAction`` and ``mSampleWindowWindow``.
All the other methods (``definesPluginInterfaces()``, ``pluginInterfacesOk()``, ``finalizePlugin()``, ``pluginsInitialized()``, ``loadSettings()``, ``saveSettings()`` and ``handleUrl()``) are left empty.

Finally, we have the `Window <https://github.com/opencor/opencor/blob/master/src/plugins/windowinterface.inl>`__ interface:

.. code-block:: c++
   :lineno-start: 144

   //==============================================================================
   // Window interface
   //==============================================================================

   Qt::DockWidgetArea SampleWindowPlugin::windowDefaultDockArea() const
   {
       // Return our default dock area

       return Qt::TopDockWidgetArea;
   }

   //==============================================================================

   QAction * SampleWindowPlugin::windowAction() const
   {
       // Return our window action

       return mSampleWindowAction;
   }

   //==============================================================================

   QDockWidget * SampleWindowPlugin::windowWidget() const
   {
       // Return our window widget

       return mSampleWindowWindow;
   }

   //==============================================================================

All three methods are implemented since they tell OpenCOR the default dock area for our plugin window (see ``windowDefaultDockArea()``; lines 148-153), as well as provide the pointer to our action (see ``windowAction()``; lines 157-162) and window (see ``windowWidget()``; lines 166-171).

.. _develop_plugins_sampleWindow_pluginSpecific:

Plugin specific
---------------

Some extra work is needed to get our plugin to do what we want, and this is done via the ``SampleWindowWindow`` class in |samplewindowwindow.h|_:

.. code-block:: c++
   :lineno-start: 28

   #include "windowwidget.h"

   //==============================================================================

   namespace Ui {
       class SampleWindowWindow;
   } // namespace Ui

   //==============================================================================

   namespace OpenCOR {
   namespace SampleWindow {

   //==============================================================================

   class SampleWindowWindow : public Core::WindowWidget
   {
       Q_OBJECT

   public:
       explicit SampleWindowWindow(QWidget *pParent);
       ~SampleWindowWindow() override;

   private:
       Ui::SampleWindowWindow *mGui;

   private slots:
       void updateSum();
   };

   //==============================================================================

   } // namespace SampleWindow
   } // namespace OpenCOR

.. |samplewindowwindow.h| replace:: ``samplewindowwindow.h``
.. _samplewindowwindow.h: https://github.com/opencor/opencor/blob/master/src/plugins/sample/SampleWindow/src/samplewindowwindow.h

``SampleWindowWindow`` inherits from ``Core::WindowWidget``, which is defined in the `Core <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/>`__ plugin and is an extended version of `Qt <https://www.qt.io/>`__'s ``QDockWidget`` class (line 43).
It also comes with a GUI file, which describes the layout of our plugin window (|samplewindowwindow.ui|_).

.. |samplewindowwindow.ui| replace:: ``samplewindowwindow.ui``
.. _samplewindowwindow.ui: https://github.com/opencor/opencor/blob/master/src/plugins/sample/SampleWindow/src/samplewindowwindow.ui

The implementation of ``SampleWindowWindow`` can be found in |samplewindowwindow.cpp|_:

.. code-block:: c++
   :lineno-start: 24

   #include "sampleutilities.h"
   #include "samplewindowwindow.h"

   //==============================================================================

   #include "ui_samplewindowwindow.h"

   //==============================================================================

   namespace OpenCOR {
   namespace SampleWindow {

   //==============================================================================

   SampleWindowWindow::SampleWindowWindow(QWidget *pParent) :
       Core::WindowWidget(pParent),
       mGui(new Ui::SampleWindowWindow)
   {
       // Set up the GUI

       mGui->setupUi(this);

       // A couple of connections to update our sum whenever one of the value of
       // one of our numbers is updated

       connect(mGui->nb1DoubleSpinBox, QOverload<double>::of(&QDoubleSpinBox::valueChanged),
               this, &SampleWindowWindow::updateSum);
       connect(mGui->nb2DoubleSpinBox, QOverload<double>::of(&QDoubleSpinBox::valueChanged),
               this, &SampleWindowWindow::updateSum);

       // Initialise our sum

       updateSum();
   }

   //==============================================================================

   SampleWindowWindow::~SampleWindowWindow()
   {
       // Delete the GUI

       delete mGui;
   }

   //==============================================================================

   void SampleWindowWindow::updateSum()
   {
       // Update our sum

       mGui->sumLabel->setText(QString::number(Sample::add(mGui->nb1DoubleSpinBox->value(), mGui->nb2DoubleSpinBox->value())));
   }

   //==============================================================================

   } // namespace SampleWindow
   } // namespace OpenCOR

.. |samplewindowwindow.cpp| replace:: ``samplewindowwindow.cpp``
.. _samplewindowwindow.cpp: https://github.com/opencor/opencor/blob/master/src/plugins/sample/SampleWindow/src/samplewindowwindow.cpp

``SampleWindowWindow()`` (lines 38-57) initialises the ``SampleWindowWindow`` object, as well as creates a couple of connections (lines 49-52) and initialises our sum by calling ``updateSum()`` (line 56).
As can be seen, ``updateSum()`` calls the ``add()`` method from the :ref:`Sample <develop_plugins_sample>` plugin (lines 70-75).
