.. _develop_plugins_sampleTools:

==============
 Sample tools
==============

The purpose of this plugin is to extend our :ref:`Sample <develop_plugins_sample>` plugin by making it possible for the user to add two numbers, be it from the command line or through OpenCOR's ``Tools`` menu.

File structure
--------------

::

  i18n
   └─ SampleTools_fr.ts
  res
   └─ SampleTools_i18n.qrc.in
  src
   ├─ sampletoolsplugin.cpp
   ├─ sampletoolsplugin.h
   └─ sampletoolsplugin.json
  CMakeLists.txt

Category
--------

Our plugin is part of the `Sample <https://github.com/opencor/opencor/tree/master/src/plugins/sample/>`__ category, which means that its code can be found under |SampleTools|_.

.. |SampleTools| replace:: ``[OpenCOR]/src/plugins/sample/SampleTools/``
.. _SampleTools: https://github.com/opencor/opencor/blob/master/src/plugins/sample/SampleTools/

Interfaces
----------

Unlike for the :ref:`Sample <develop_plugins_sample>` plugin, we want our plugin to interact with OpenCOR.
This means that it needs to implement some :ref:`interfaces <develop_plugins_index_interfaces>`.

More specifically, we want our plugin to work from the command line, so we need to implement the `CLI <https://github.com/opencor/opencor/blob/master/src/plugins/cliinterface.inl>`__ interface.
We also want our plugin to work through OpenCOR's ``Tools`` menu, which involves creating a menu item and making it available to OpenCOR so that it can add it for us to its ``Tools`` menu.
To do these, we need to implement both the `GUI <https://github.com/opencor/opencor/blob/master/src/plugins/guiinterface.inl>`__ and `Plugin <https://github.com/opencor/opencor/blob/master/src/plugins/plugininterface.inl>`__ interfaces.
While we are at it, we might as well internationalise our plugin, in which case it means that we also need to implement the `Internationalisation <https://github.com/opencor/opencor/blob/master/src/plugins/i18ninterface.inl>`__ interface.

CMake project
-------------

As for the :ref:`Sample <develop_plugins_sample>` plugin, our plugin has a |CMakeLists.txt|_ file, which contents is:

.. code-block:: cmake
   :lineno-start: 1

   project(SampleToolsPlugin)

   # Add the plugin

   add_plugin(SampleTools
       SOURCES
           ../../cliinterface.cpp
           ../../guiinterface.cpp
           ../../i18ninterface.cpp
           ../../plugininfo.cpp
           ../../plugininterface.cpp

           src/sampletoolsplugin.cpp
       HEADERS_MOC
           src/sampletoolsplugin.h
       PLUGINS
           Core
           Sample
   )

.. |CMakeLists.txt| replace:: ``CMakeLists.txt``
.. _CMakeLists.txt: https://github.com/opencor/opencor/blob/master/src/plugins/sample/SampleTools/CMakeLists.txt

Some of the interfaces our plugin implements come with a ``.cpp`` file, so we reference them (lines 7-9 and 11).
Then, our plugin needs the `Core <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/>`__ and `Sample <https://github.com/opencor/opencor/tree/master/src/plugins/sample/Sample/>`__ plugins (the latter, to be able to use its ``add()`` function), so they are referenced (lines 17 and 18) using the ``PLUGINS`` keyword (line 16).

Plugin information
------------------

Our :ref:`plugin information <develop_plugins_index_pluginInformation>` can be found in |sampletoolsplugin.cpp|_, |sampletoolsplugin.h|_ and |sampletoolsplugin.json|_. Starting with |sampletoolsplugin.h|_, its contents is:

.. code-block:: c++
   :lineno-start: 28

   #include "cliinterface.h"
   #include "guiinterface.h"
   #include "i18ninterface.h"
   #include "plugininfo.h"
   #include "plugininterface.h"

   //==============================================================================

   namespace OpenCOR {
   namespace SampleTools {

   //==============================================================================

   PLUGININFO_FUNC SampleToolsPluginInfo();

   //==============================================================================

   class SampleToolsPlugin : public QObject, public CliInterface,
                             public GuiInterface, public I18nInterface,
                             public PluginInterface
   {
       Q_OBJECT

       Q_PLUGIN_METADATA(IID "OpenCOR.SampleToolsPlugin" FILE "sampletoolsplugin.json")

       Q_INTERFACES(OpenCOR::CliInterface)
       Q_INTERFACES(OpenCOR::GuiInterface)
       Q_INTERFACES(OpenCOR::I18nInterface)
       Q_INTERFACES(OpenCOR::PluginInterface)

   public:
   #include "cliinterface.inl"
   #include "guiinterface.inl"
   #include "i18ninterface.inl"
   #include "plugininterface.inl"

   private:
       QAction *mAddTwoNumbersAction;

       void runHelpCommand();
       int runAddCommand(const QStringList &pArguments);

   private slots:
       void addTwoNumbers();
   };

   //==============================================================================

   }   // namespace SampleTools
   }   // namespace OpenCOR

.. |sampletoolsplugin.cpp| replace:: ``sampletoolsplugin.cpp``
.. _sampletoolsplugin.cpp: https://github.com/opencor/opencor/blob/master/src/plugins/sample/SampleTools/src/sampletoolsplugin.cpp

.. |sampletoolsplugin.h| replace:: ``sampletoolsplugin.h``
.. _sampletoolsplugin.h: https://github.com/opencor/opencor/blob/master/src/plugins/sample/SampleTools/src/sampletoolsplugin.h

.. |sampletoolsplugin.json| replace:: ``sampletoolsplugin.json``
.. _sampletoolsplugin.json: https://github.com/opencor/opencor/blob/master/src/plugins/sample/SampleTools/src/sampletoolsplugin.json

As mentioned above, our plugin implements some interfaces, which means that their header file is included (lines 28-30 and 32).
It also means that our plugin class inherits from those interfaces (lines 45-47), as well as make calls to the ``Q_INTERFACES()`` macro to let `Qt <https://www.qt.io/>`__ know which interfaces it implements (lines 53-56).
Finally, we include the inline files (lines 59-62) that declare various methods that must be implemented by our plugin (see the :ref:`next section <develop_plugins_sampleTools_interfacesImplementation>`).
(The rest of the class definition is specific to our plugin and is discussed :ref:`below <develop_plugins_sampleTools_pluginSpecific>`.)

The C function that is used by OpenCOR to retrieve some :ref:`basic information <develop_plugins_index_basicInformation>` about our plugin can be found in |sampletoolsplugin.cpp|_:

.. code-block:: c++
   :lineno-start: 45

   PLUGININFO_FUNC SampleToolsPluginInfo()
   {
       Descriptions descriptions;

       descriptions.insert("en", QString::fromUtf8("a plugin that provides an addition tool."));
       descriptions.insert("fr", QString::fromUtf8("une extension qui fournit un outil d'addition."));

       return new PluginInfo(PluginInfo::Sample, true, true,
                             QStringList() << "Core" << "Sample",
                             descriptions);
   }

As can be seen, our plugin is selectable by the user and it offers direct `CLI <https://en.wikipedia.org/wiki/Command-line_interface>`__ support (line 52).
It also has a direct dependency on the `Core <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/>`__ and `Sample <https://github.com/opencor/opencor/tree/master/src/plugins/sample/Sample/>`__ plugins (line 53).

.. _develop_plugins_sampleTools_interfacesImplementation:

Interfaces implementation
-------------------------

The implementation of the interfaces' various methods can be found in |sampletoolsplugin.cpp|_.
The methods are grouped by interface and are ordered alphabetically.

We start with the `CLI <https://github.com/opencor/opencor/blob/master/src/plugins/cliinterface.inl>`__ interface:

.. code-block:: c++
   :lineno-start: 57

   //==============================================================================
   // CLI interface
   //==============================================================================

   int SampleToolsPlugin::executeCommand(const QString &pCommand,
                                         const QStringList &pArguments)
   {
       // Run the given CLI command

       if (!pCommand.compare("help")) {
           // Display the commands that we support

           runHelpCommand();

           return 0;
       } else if (!pCommand.compare("add")) {
           // Add some numbers

           return runAddCommand(pArguments);
       } else {
           // Not a CLI command that we support, so show our help and leave

           runHelpCommand();

           return -1;
       }
   }

   //==============================================================================

As can be seen, our plugin handles both the ``help`` and ``add`` commands (lines 66-72 and 72-76, respectively).

Next, we have the `GUI <https://github.com/opencor/opencor/blob/master/src/plugins/guiinterface.inl>`__ interface:

.. code-block:: c++
   :lineno-start: 85

   //==============================================================================
   // GUI interface
   //==============================================================================

   void SampleToolsPlugin::updateGui(Plugin *pViewPlugin, const QString &pFileName)
   {
       Q_UNUSED(pViewPlugin);
       Q_UNUSED(pFileName);

       // We don't handle this interface...
   }

   //==============================================================================

   Gui::Menus SampleToolsPlugin::guiMenus() const
   {
       // We don't handle this interface...

       return Gui::Menus();
   }

   //==============================================================================

   Gui::MenuActions SampleToolsPlugin::guiMenuActions() const
   {
       // Return our menu actions

       return Gui::MenuActions() << Gui::MenuAction(Gui::MenuAction::Tools, mAddTwoNumbersAction)
                                 << Gui::MenuAction(Gui::MenuAction::Tools, Core::newSeparator(Core::mainWindow()));
   }

   //==============================================================================

Our plugin does not need to do anything whenever OpenCOR needs to update the `GUI <https://en.wikipedia.org/wiki/Graphical_user_interface>`__, so we do nothing in ``updateGui()`` (lines 89-95).
Similarly, we do not need to add menus to OpenCOR, so all ``guiMenus()`` does is return ``Gui::Menus()`` (lines 99-104).
However, we do want to add a menu action (and a menu separator) to OpenCOR's ``Tools`` menu, which we do via ``guiMenuActions()`` (lines 108-114).
Note that ``mAddTwoNumbersAction`` is initialised in our implementation of the `Plugin <https://github.com/opencor/opencor/blob/master/src/plugins/plugininterface.inl>`__ interface (see :ref:`below <develop_plugins_sampleTools_pluginInterface>`).

After the `GUI <https://github.com/opencor/opencor/blob/master/src/plugins/guiinterface.inl>`__ interface, we have the `Internationalisation <https://github.com/opencor/opencor/blob/master/src/plugins/i18ninterface.inl>`__ interface:

.. code-block:: c++
   :lineno-start: 116

   //==============================================================================
   // I18n interface
   //==============================================================================

   void SampleToolsPlugin::retranslateUi()
   {
       // Retranslate our different Tools actions

       retranslateAction(mAddTwoNumbersAction, tr("Add Two Numbers..."), tr("Add two numbers together"));
   }

   //==============================================================================

All that we need to do here is to (re)translate ``mAddTwoNumbersAction`` with the actual (French) translations in |SampleTools_fr.ts|_ (together with some other translations needed in the :ref:`next section <develop_plugins_sampleTools_pluginSpecific>`).

.. |SampleTools_fr.ts| replace:: ``SampleTools_fr.ts``
.. _SampleTools_fr.ts: https://github.com/opencor/opencor/tree/master/src/plugins/sample/SampleTools/i18n/SampleTools_fr.ts

.. _develop_plugins_sampleTools_pluginInterface:

Finally, we have the `Plugin <https://github.com/opencor/opencor/blob/master/src/plugins/plugininterface.inl>`__ interface:

.. code-block:: c++
   :lineno-start: 127

   //==============================================================================
   // Plugin interface
   //==============================================================================

   bool SampleToolsPlugin::definesPluginInterfaces()
   {
       // We don't handle this interface...

       return false;
   }

   //==============================================================================

   bool SampleToolsPlugin::pluginInterfacesOk(const QString &pFileName,
                                              QObject *pInstance)
   {
       Q_UNUSED(pFileName);
       Q_UNUSED(pInstance);

       // We don't handle this interface...

       return false;
   }

   //==============================================================================

   void SampleToolsPlugin::initializePlugin()
   {
       // Create our Add Two Numbers action

       mAddTwoNumbersAction = new QAction(Core::mainWindow());

       // A connection to handle our Add Two Numbers action

       connect(mAddTwoNumbersAction, &QAction::triggered,
               this, &SampleToolsPlugin::addTwoNumbers);
   }

   //==============================================================================

   void SampleToolsPlugin::finalizePlugin()
   {
       // We don't handle this interface...
   }

   //==============================================================================

   void SampleToolsPlugin::pluginsInitialized(const Plugins &pLoadedPlugins)
   {
       Q_UNUSED(pLoadedPlugins);

       // We don't handle this interface...
   }

   //==============================================================================

   void SampleToolsPlugin::loadSettings(QSettings *pSettings)
   {
       Q_UNUSED(pSettings);

       // We don't handle this interface...
   }

   //==============================================================================

   void SampleToolsPlugin::saveSettings(QSettings *pSettings) const
   {
       Q_UNUSED(pSettings);

       // We don't handle this interface...
   }

   //==============================================================================

   void SampleToolsPlugin::handleUrl(const QUrl &pUrl)
   {
       Q_UNUSED(pUrl);

       // We don't handle this interface...
   }

   //==============================================================================

The only method of interest to our plugin is ``initializePlugin()`` (lines 153-163), which is where we initialise ``mAddTwoNumbersAction``, among other things.
All the other methods (``definesPluginInterfaces()``, ``pluginInterfacesOk()``, ``finalizePlugin()``, ``pluginsInitialized()``, ``loadSettings()``, ``saveSettings()`` and ``handleUrl()``) are left empty.

.. _develop_plugins_sampleTools_pluginSpecific:

Plugin specific
---------------

Some extra methods are needed to get our plugin to do what it is supposed to be doing.
They are declared in the ``SampleToolsPlugin`` class in |sampletoolsplugin.h|_:

.. code-block:: c++
   :lineno-start: 64

   private:
       QAction *mAddTwoNumbersAction;

       void runHelpCommand();
       int runAddCommand(const QStringList &pArguments);

   private slots:
       void addTwoNumbers();

Their implementation can be found in |sampletoolsplugin.cpp|_:

.. code-block:: c++
   :lineno-start: 208

   //==============================================================================
   // Plugin specific
   //==============================================================================

   void SampleToolsPlugin::runHelpCommand()
   {
       // Output the commands we support

       std::cout << "Commands supported by the SampleTools plugin:" << std::endl;
       std::cout << " * Display the commands supported by the SampleTools plugin:" << std::endl;
       std::cout << "      help" << std::endl;
       std::cout << " * Add two numbers:" << std::endl;
       std::cout << "      add <nb1> <nb2>" << std::endl;
   }

   //==============================================================================

   int SampleToolsPlugin::runAddCommand(const QStringList &pArguments)
   {
       // Make sure that we have the correct number of arguments

       if (pArguments.count() != 2) {
           runHelpCommand();

           return -1;
       }

       // Make sure that the two arguments are valid numbers

       bool ok;

       double nb1 = pArguments.first().toDouble(&ok);

       if (!ok) {
           std::cout << "Sorry, but " << qPrintable(pArguments.first()) << " is not a valid number." << std::endl;

           return -1;
       }

       double nb2 = pArguments.last().toDouble(&ok);

       if (!ok) {
           std::cout << "Sorry, but " << qPrintable(pArguments.last()) << " is not a valid number." << std::endl;

           return -1;
       }

       // Add the two numbers and output the result

       std::cout << qPrintable(pArguments.first()) << " + " << qPrintable(pArguments.last()) << " = " << Sample::add(nb1, nb2) << std::endl;

       return 0;
   }

   //==============================================================================

   void SampleToolsPlugin::addTwoNumbers()
   {
       bool ok;
       double nb1 = QInputDialog::getDouble(Core::mainWindow(), tr("Add Two Numbers"), tr("First number:"),
                                            0, -2147483647, 2147483647, 1, &ok);
       double nb2;

       if (ok) {
           nb2 = QInputDialog::getDouble(Core::mainWindow(), tr("Add Two Numbers"), tr("Second number:"),
                                         0, -2147483647, 2147483647, 1, &ok);

           if (ok) {
               Core::informationMessageBox(tr("Add Two Numbers"),
                                           QString::number(nb1)+" + "+QString::number(nb2)+" = "+QString::number(Sample::add(nb1, nb2)));
           }
       }
   }

   //==============================================================================

``runHelpCommand()`` (lines 212-221) is the method that is executed whenever our plugin is asked to handle the ``help`` command.
It provides the user with some information about the commands it supports.
In a similar way, ``runAddCommand()`` (lines 225-260) is executed whenever our plugin is asked to handle the ``add`` command.
It checks that two numbers have been passed to the command and, if so, returns their sum to the user.

``addTwoNumbers()`` (lines 264-280) is a `Qt <https://www.qt.io/>`__ slot that is executed whenever the user selects our menu item (see ``mAddTwoNumbersAction``).
Using a `GUI <https://en.wikipedia.org/wiki/Graphical_user_interface>`__ approach, it asks the user to provide two numbers and returns their sum, unless the user decides to cancel the action.
