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
This means that it needs to implement some :ref:`interfaces <develop_plugins_index_interfaces>`.

More specifically, we want our plugin to be a view, so we need to implement both the `File handling <https://github.com/opencor/opencor/blob/master/src/plugins/filehandlinginterface.inl>`__, `Plugin <https://github.com/opencor/opencor/blob/master/src/plugins/plugininterface.inl>`__ and `View <https://github.com/opencor/opencor/blob/master/src/plugins/viewinterface.inl>`__ interfaces.
While we are at it, we might as well internationalise our plugin, in which case it means that we also need to implement the `Internationalisation <https://github.com/opencor/opencor/blob/master/src/plugins/i18ninterface.inl>`__ interface.

CMake project
-------------

As for the :ref:`Sample <develop_plugins_sample>` plugin, our plugin has a |CMakeLists.txt|_ file, which contents is:

.. code-block:: cmake
   :lineno-start: 1

   project(SampleViewPlugin)

   # Add the plugin

   add_plugin(SampleView
       SOURCES
           ../../filehandlinginterface.cpp
           ../../i18ninterface.cpp
           ../../plugininfo.cpp
           ../../plugininterface.cpp
           ../../viewinterface.cpp

           src/sampleviewplugin.cpp
           src/sampleviewwidget.cpp
       HEADERS_MOC
           src/sampleviewplugin.h
           src/sampleviewwidget.h
       UIS
           src/sampleviewwidget.ui
       PLUGINS
           Core
   )

.. |CMakeLists.txt| replace:: ``CMakeLists.txt``
.. _CMakeLists.txt: https://github.com/opencor/opencor/blob/master/src/plugins/sample/SampleView/CMakeLists.txt

Some of the interfaces our plugin implements come with a ``.cpp`` file, so we reference them (lines 7, 8, 10 and 11).
Then, our plugin needs the `Core <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/>`__ plugin, so it is referenced (line 21) using the ``PLUGINS`` keyword (line 20).
Our plugin provides OpenCOR with a test view, which is implemented using various files (lines 14, 17 and 19).
One of those files is a ``.ui`` file, which is referenced using the ``UIS`` keyword (line 18).

Plugin information
------------------

Our :ref:`plugin information <develop_plugins_index_pluginInformation>` can be found in |sampleviewplugin.cpp|_, |sampleviewplugin.h|_ and |sampleviewplugin.json|_.
Starting with |sampleviewplugin.h|_, its contents is:

.. code-block:: c++
   :lineno-start: 28

   #include "filehandlinginterface.h"
   #include "i18ninterface.h"
   #include "plugininfo.h"
   #include "plugininterface.h"
   #include "viewinterface.h"

   //==============================================================================

   namespace OpenCOR {
   namespace SampleView {

   //==============================================================================

   PLUGININFO_FUNC SampleViewPluginInfo();

   //==============================================================================

   class SampleViewWidget;

   //==============================================================================

   class SampleViewPlugin : public QObject, public FileHandlingInterface,
                            public I18nInterface, public PluginInterface,
                            public ViewInterface
   {
       Q_OBJECT

       Q_PLUGIN_METADATA(IID "OpenCOR.SampleViewPlugin" FILE "sampleviewplugin.json")

       Q_INTERFACES(OpenCOR::FileHandlingInterface)
       Q_INTERFACES(OpenCOR::I18nInterface)
       Q_INTERFACES(OpenCOR::PluginInterface)
       Q_INTERFACES(OpenCOR::ViewInterface)

   public:
       explicit SampleViewPlugin();

   #include "filehandlinginterface.inl"
   #include "i18ninterface.inl"
   #include "plugininterface.inl"
   #include "viewinterface.inl"

   private:
       SampleViewWidget *mViewWidget;

       QString mFileName;
   };

   //==============================================================================

   }   // namespace SampleView
   }   // namespace OpenCOR

.. |sampleviewplugin.cpp| replace:: ``sampleviewplugin.cpp``
.. _sampleviewplugin.cpp: https://github.com/opencor/opencor/blob/master/src/plugins/sample/SampleView/src/sampleviewplugin.cpp

.. |sampleviewplugin.h| replace:: ``sampleviewplugin.h``
.. _sampleviewplugin.h: https://github.com/opencor/opencor/blob/master/src/plugins/sample/SampleView/src/sampleviewplugin.h

.. |sampleviewplugin.json| replace:: ``sampleviewplugin.json``
.. _sampleviewplugin.json: https://github.com/opencor/opencor/blob/master/src/plugins/sample/SampleView/src/sampleviewplugin.json

As mentioned above, our plugin implements some interfaces, which means that their header file is included (lines 28, 29, 31 and 32).
It also means that our plugin class inherits from those interfaces (lines 49-51), as well as make calls to the ``Q_INTERFACES()`` macro to let `Qt <https://www.qt.io/>`__ know which interfaces it implements (lines 57-60).
Finally, we include the inline files (lines 65-68) that declare various methods that must be implemented by our plugin (see the :ref:`next section <develop_plugins_sampleView_interfacesImplementation>`).
(The rest of the class definition is specific to our plugin and is discussed :ref:`below <develop_plugins_sampleView_pluginSpecific>`.)

The C function that is used by OpenCOR to retrieve some :ref:`basic information <develop_plugins_index_basicInformation>` about our plugin can be found in |sampleviewplugin.cpp|_:

.. code-block:: c++
   :lineno-start: 40

   PLUGININFO_FUNC SampleViewPluginInfo()
   {
       Descriptions descriptions;

       descriptions.insert("en", QString::fromUtf8("a plugin that provides a test view."));
       descriptions.insert("fr", QString::fromUtf8("une extension qui fournit une vue de test."));

       return new PluginInfo(PluginInfo::Sample, true, false,
                             QStringList() << "Core",
                             descriptions);
   }

As can be seen, our plugin is selectable by the user, but it does not offer direct `CLI <https://en.wikipedia.org/wiki/Command-line_interface>`__ support (line 47).
It also has a direct dependency on the `Core <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/>`__ plugin (line 48).

.. _develop_plugins_sampleView_interfacesImplementation:

Interfaces implementation
-------------------------

The implementation of the interfaces' various methods can also be found in |sampleviewplugin.cpp|_.
The methods are grouped by interface and are ordered alphabetically.
The interfaces are also ordered alphabetically, making it easier to read and maintain the code.

We start with the `File handling <https://github.com/opencor/opencor/blob/master/src/plugins/filehandlinginterface.inl>`__ interface:

.. code-block:: c++
   :lineno-start: 59

   //==============================================================================
   // File handling interface
   //==============================================================================

   bool SampleViewPlugin::saveFile(const QString &pOldFileName,
                                   const QString &pNewFileName,
                                   bool &pNeedFeedback)
   {
       Q_UNUSED(pOldFileName);
       Q_UNUSED(pNewFileName);
       Q_UNUSED(pNeedFeedback);

       // We don't handle this interface...

       return false;
   }

   //==============================================================================

   void SampleViewPlugin::fileOpened(const QString &pFileName)
   {
       Q_UNUSED(pFileName);

       // We don't handle this interface...
   }

   //==============================================================================

   void SampleViewPlugin::filePermissionsChanged(const QString &pFileName)
   {
       // The given file has had its permissions changed, so update our view
       // widget, if needed

       if (!pFileName.compare(mFileName))
           mViewWidget->update(pFileName);
   }

   //==============================================================================

   void SampleViewPlugin::fileModified(const QString &pFileName)
   {
       Q_UNUSED(pFileName);

       // We don't handle this interface...
   }

   //==============================================================================

   void SampleViewPlugin::fileSaved(const QString &pFileName)
   {
       Q_UNUSED(pFileName);

       // We don't handle this interface...
   }

   //==============================================================================

   void SampleViewPlugin::fileReloaded(const QString &pFileName)
   {
       // The given file has been reloaded, so update our view widget, if needed

       if (!pFileName.compare(mFileName))
           mViewWidget->update(pFileName);
   }

   //==============================================================================

   void SampleViewPlugin::fileRenamed(const QString &pOldFileName,
                                      const QString &pNewFileName)
   {
       Q_UNUSED(pOldFileName);

       // The given file has been renamed, so update our view widget, if needed

       if (!pOldFileName.compare(mFileName)) {
           mFileName = pNewFileName;

           mViewWidget->update(pNewFileName);
       }
   }

   //==============================================================================

   void SampleViewPlugin::fileClosed(const QString &pFileName)
   {
       // The given file has been closed, so update our internals, if needed

       if (!pFileName.compare(mFileName))
           mFileName = QString();
   }

   //==============================================================================

Our plugin provides a view and, as such, should at least handle some of the `File handling <https://github.com/opencor/opencor/blob/master/src/plugins/filehandlinginterface.inl>`__ interface's methods.
Here, we want our plugin to provide some information about the current file, so we do not need to implement ``saveFile()`` (lines 63-74), ``fileOpened()`` (lines 78-83), ``fileModified()`` (lines 98-103) and ``fileSaved()`` (lines 107-112).
On the other hand, should the current file have its permissions changed or be renamed, then we want to update the information presented in our view.
We do this by implementing the ``filePermissionsChanged()`` (lines 87-94) and ``fileReloaded()`` (lines 116-122) methods.
The same holds true if the current file gets renamed, in which case we also want to update ``mFileName`` (see ``fileRenamed()``; lines 126-138).
Finally, we want to reset ``mFileName`` if the current file gets closed (see ``fileClosed()``; lines 142-148).

Next, we have the `Internationalisation <https://github.com/opencor/opencor/blob/master/src/plugins/i18ninterface.inl>`__ interface:

.. code-block:: c++
   :lineno-start: 150

   //==============================================================================
   // I18n interface
   //==============================================================================

   void SampleViewPlugin::retranslateUi()
   {
       // Retranslate our view widget, if needed

       if (!mFileName.isEmpty())
           mViewWidget->retranslateUi();
   }

   //==============================================================================

If some information is being shown for a file, then we ask our view to retranslate itself.

After the `Internationalisation <https://github.com/opencor/opencor/blob/master/src/plugins/i18ninterface.inl>`__ interface, we have the `Plugin <https://github.com/opencor/opencor/blob/master/src/plugins/plugininterface.inl>`__ interface:

.. code-block:: c++
   :lineno-start: 162

   //==============================================================================
   // Plugin interface
   //==============================================================================

   bool SampleViewPlugin::definesPluginInterfaces()
   {
       // We don't handle this interface...

       return false;
   }

   //==============================================================================

   bool SampleViewPlugin::pluginInterfacesOk(const QString &pFileName,
                                             QObject *pInstance)
   {
       Q_UNUSED(pFileName);
       Q_UNUSED(pInstance);

       // We don't handle this interface...

       return false;
   }

   //==============================================================================

   void SampleViewPlugin::initializePlugin()
   {
       // Create our Sample view widget

       mViewWidget = new SampleViewWidget(Core::mainWindow());

       // Hide our Sample view widget since it may not initially be shown in our
       // central widget

       mViewWidget->setVisible(false);
   }

   //==============================================================================

   void SampleViewPlugin::finalizePlugin()
   {
       // We don't handle this interface...
   }

   //==============================================================================

   void SampleViewPlugin::pluginsInitialized(const Plugins &pLoadedPlugins)
   {
       Q_UNUSED(pLoadedPlugins);

       // We don't handle this interface...
   }

   //==============================================================================

   void SampleViewPlugin::loadSettings(QSettings *pSettings)
   {
       Q_UNUSED(pSettings);

       // We don't handle this interface...
   }

   //==============================================================================

   void SampleViewPlugin::saveSettings(QSettings *pSettings) const
   {
       Q_UNUSED(pSettings);

       // We don't handle this interface...
   }

   //==============================================================================

   void SampleViewPlugin::handleUrl(const QUrl &pUrl)
   {
       Q_UNUSED(pUrl);

       // We don't handle this interface...
   }

   //==============================================================================

The only method of interest to our plugin is ``initializePlugin()`` (lines 188-198), which is where we initialise ``mViewWidget``, our view.
All the other methods (``definesPluginInterfaces()``, ``pluginInterfacesOk()``, ``finalizePlugin()``, ``pluginsInitialized()``, ``loadSettings()``, ``saveSettings()`` and ``handleUrl()``) are left empty.

Finally, we have the `View <https://github.com/opencor/opencor/blob/master/src/plugins/viewinterface.inl>`__ interface:

.. code-block:: c++
   :lineno-start: 243

   //==============================================================================
   // View interface
   //==============================================================================

   ViewInterface::Mode SampleViewPlugin::viewMode() const
   {
       // Return our mode

       return SampleMode;
   }

   //==============================================================================

   QStringList SampleViewPlugin::viewMimeTypes() const
   {
       // Return the MIME types we support, i.e. any in our case

       return QStringList();
   }

   //==============================================================================

   QString SampleViewPlugin::viewMimeType(const QString &pFileName) const
   {
       Q_UNUSED(pFileName)

       // Return the MIME type for the given file

       return QString();
   }

   //==============================================================================

   QString SampleViewPlugin::viewDefaultFileExtension() const
   {
       // Return the default file extension we support

       return QString();
   }

   //==============================================================================

   QWidget * SampleViewPlugin::viewWidget(const QString &pFileName)
   {
       // Update and return our Sample view widget using the given file

       mFileName = pFileName;

       mViewWidget->update(pFileName);

       return mViewWidget;
   }

   //==============================================================================

   void SampleViewPlugin::removeViewWidget(const QString &pFileName)
   {
       Q_UNUSED(pFileName);

       // Reset our internals

       mFileName = QString();
   }

   //==============================================================================

   QString SampleViewPlugin::viewName() const
   {
       // Return our Sample view's name

       return tr("Sample");
   }

   //==============================================================================

   QIcon SampleViewPlugin::fileTabIcon(const QString &pFileName) const
   {
       Q_UNUSED(pFileName);

       // We don't handle this interface...

       return QIcon();
   }

   //==============================================================================

Our plugin provides a view, so OpenCOR needs to know about its name (see ``viewName()``; lines 309-314), its type (see ``viewMode()``; lines 247-252), the MIME types it supports (see ``viewMimeTypes()``; lines 256-261), the MIME type supported by a given file (see ``viewMimeType()``; lines 265-272), the default file extension it supports (see ``viewDefaultFileExtension()``; lines 276-281) and whether it needs a special tab icon (see ``fileTabIcon()``; lines 318-325).
OpenCOR also needs to know the widget that is used for the view and this for a given file (see ``viewWidget()``; lines 285-294).
Note that our plugin uses only one view widget (and updates its contents based on the file that is currently active), but it might perfectly use one per file.
Finally, our plugin needs to handle the case where a view widget is to be removed (see ``removeViewWidget()``; lines 298-305), which happens whenever a file gets closed.

.. _develop_plugins_sampleView_pluginSpecific:

Plugin specific
---------------

Some extra work is needed to get our plugin to do what it is supposed to be doing, and this is done via the ``SampleViewWidget`` class in |sampleviewwidget.h|_:

.. code-block:: c++
   :lineno-start: 28

   #include "viewwidget.h"

   //==============================================================================

   namespace Ui {
       class SampleViewWidget;
   }   // namespace Ui

   //==============================================================================

   namespace OpenCOR {
   namespace SampleView {

   //==============================================================================

   class SampleViewWidget : public Core::ViewWidget
   {
       Q_OBJECT

   public:
       explicit SampleViewWidget(QWidget *pParent);
       ~SampleViewWidget() override;

       void retranslateUi() override;

       QWidget * widget(const QString &pFileName) override;

       void update(const QString &pFileName);

   private:
       Ui::SampleViewWidget *mGui;

       QString mFileName;
   };

   //==============================================================================

   }   // namespace SampleView
   }   // namespace OpenCOR

.. |sampleviewwidget.h| replace:: ``sampleviewwidget.h``
.. _sampleviewwidget.h: https://github.com/opencor/opencor/blob/master/src/plugins/sample/SampleView/src/sampleviewwidget.h

``SampleViewWidget`` inherits from ``Core::ViewWidget``, which is defined in the `Core <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/>`__ plugin and is an extended version of `Qt <https://www.qt.io/>`__'s ``QWidget`` (line 43).
It requires implementing the ``widget()`` method, which purpose is to return the exact widget that is to be shown in the view (line 53).
In the present case, it is ``SampleViewWidget`` itself.
Otherwise, ``SampleViewWidget`` also comes with a GUI file, which describes the layout of our plugin window (|sampleviewwidget.ui|_).
The ``update()`` method is used by our plugin to update the contents of our view using information about the given file (line 55).

.. |sampleviewwidget.ui| replace:: ``sampleviewwidget.ui``
.. _sampleviewwidget.ui: https://github.com/opencor/opencor/blob/master/src/plugins/sample/SampleView/src/sampleviewwidget.ui

The implementation of ``SampleViewWidget`` can be found in |sampleviewwidget.cpp|_:

.. code-block:: c++
   :lineno-start: 24

   #include "corecliutils.h"
   #include "filemanager.h"
   #include "sampleviewwidget.h"

   //==============================================================================

   #include "ui_sampleviewwidget.h"

   //==============================================================================

   #include <QFile>

   //==============================================================================

   namespace OpenCOR {
   namespace SampleView {

   //==============================================================================

   SampleViewWidget::SampleViewWidget(QWidget *pParent) :
       ViewWidget(pParent),
       mGui(new Ui::SampleViewWidget),
       mFileName(QString())
   {
       // Delete the layout that comes with ViewWidget

       delete layout();

       // Set up the GUI

       mGui->setupUi(this);
   }

   //==============================================================================

   SampleViewWidget::~SampleViewWidget()
   {
       // Delete the GUI

       delete mGui;
   }

   //==============================================================================

   void SampleViewWidget::retranslateUi()
   {
       // Retranslate our GUI

       mGui->retranslateUi(this);

       // Update ourself too since some widgets will have been reset following the
       // retranslation (e.g. mGui->fileNameValue)

       update(mFileName);
   }

   //==============================================================================

   QWidget * SampleViewWidget::widget(const QString &pFileName)
   {
       Q_UNUSED(pFileName);

       // Return the requested (self) widget

       return this;
   }

   //==============================================================================

   void SampleViewWidget::update(const QString &pFileName)
   {
       // Keep track of the given file name

       mFileName = pFileName;

       // Initialise our GUI with some information about the given file

       mGui->fileNameValue->setText(pFileName);

       Core::FileManager *fileManagerInstance = Core::FileManager::instance();

       mGui->lockedValue->setText(fileManagerInstance->isLocked(pFileName)?tr("Yes"):tr("No"));

       QString sha1Value = fileManagerInstance->sha1(pFileName);

       mGui->sha1Value->setText(sha1Value.isEmpty()?"???":sha1Value);
       mGui->sizeValue->setText(Core::sizeAsString(QFile(pFileName).size()));
   }

   //==============================================================================

   }   // namespace SampleView
   }   // namespace OpenCOR

.. |sampleviewwidget.cpp| replace:: ``sampleviewwidget.cpp``
.. _sampleviewwidget.cpp: https://github.com/opencor/opencor/blob/master/src/plugins/sample/SampleView/src/sampleviewwidget.cpp

``retranslateUi()`` (lines 68-78) retranslates our view, as well as return its exact widget (lines 82-89) and update its contents using ``update()`` (lines 93-111).
