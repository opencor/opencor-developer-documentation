.. _develop_internationalisation:

======================
 Internationalisation
======================

OpenCOR is a multilingual application, currently supporting both English and French.
By default, it will try to use the system language, but if it is not supported, then English will be used instead.
Alternatively, any of the languages supported by OpenCOR can be used.

OpenCOR
-------

There are two sets of language files to consider:

#. **Qt-specific translation files:** these files are originally located under ``[Qt]/[QtVersion]/[CompilerVersion]/translations/qtXXX_xx.qm`` with ``XXX`` the type of translations (e.g. ``base``) and ``xx`` the language code (e.g. ``fr`` for French).
   For every language supported by OpenCOR (except for English, which is natively supported by Qt), we need to add the corresponding Qt-specific translation files to |translations|_.
   Then, an entry for those files must be added to |translations.qrc|_:

   .. code-block:: xml

      <file>translations/qt_help_xx.qm</file>
      <file>translations/qtbase_xx.qm</file>
      <file>translations/qtxmlpatterns_xx.qm</file>

   .. |translations| replace:: ``[OpenCOR]/res/translations``
   .. _translations: https://github.com/opencor/opencor/tree/master/res/translations

   .. |translations.qrc| replace:: ``[OpenCOR]/res/translations.qrc``
   .. _translations.qrc: https://github.com/opencor/opencor/blob/master/res/translations.qrc

#. **OpenCOR-specific translation files:** for each supported language (again, except for English), a file called ``[OpenCOR]/i18n/OpenCOR_xx.ts`` must be created.
   The best way to go about it is by starting from an existing language file (e.g. |OpenCOR_fr.ts|_).
   From there, locate the following line:

   .. code-block:: xml

      <TS version="2.1" language="xx_XX" sourcelanguage="en_GB">

   .. |OpenCOR_fr.ts| replace:: ``[OpenCOR]/i18n/OpenCOR_fr.ts``
   .. _OpenCOR_fr.ts: https://github.com/opencor/opencor/tree/master/i18n/OpenCOR_fr.ts

   and replace ``xx_XX`` accordingly. Otherwise, as for the Qt-specific file above, an entry for the OpenCOR-specific translation file must be added to |i18n.qrc.in|_ (``PROJECT_BUILD_DIR`` is automatically replaced during the build process):

   .. code-block:: xml

      <file alias="app_xx">${PROJECT_BUILD_DIR}/OpenCOR_xx.qm</file>

   .. |i18n.qrc.in| replace:: ``[OpenCOR]/res/i18n.qrc.in``
   .. _i18n.qrc.in: https://github.com/opencor/opencor/tree/master/res/i18n.qrc.in

   ``OpenCOR_xx.qm`` gets automatically generated from ``OpenCOR_xx.ts`` when :ref:`building OpenCOR <buildTestAndRun>`.
   This does, however, require updating the ``update_language_files()`` macro in |common.cmake|_, so that ``LANGUAGES`` gets set as follows:

   .. code-block:: cmake

      set(LANGUAGES ... xx ...)

   .. |common.cmake| replace:: ``[OpenCOR]/cmake/common.cmake``
   .. _common.cmake: https://github.com/opencor/opencor/tree/master/cmake/common.cmake

On the graphical user interface (GUI) side of OpenCOR, both an action and a menu item must be created for each supported language.
The best way to add GUI support for a new language is by mimicking what has been done for ``actionEnglish`` in |mainwindow.ui|_.
Then, a similar mimicking work must be done in |mainwindow.cpp|_ and |mainwindow.h|_ (look for ``actionEnglish`` and ``EnglishLocale``).

   .. |mainwindow.ui| replace:: ``[OpenCOR]/src/mainwindow.ui``
   .. _mainwindow.ui: https://github.com/opencor/opencor/tree/master/src/mainwindow.ui

   .. |mainwindow.cpp| replace:: ``[OpenCOR]/src/mainwindow.cpp``
   .. _mainwindow.cpp: https://github.com/opencor/opencor/tree/master/src/mainwindow.cpp

   .. |mainwindow.h| replace:: ``[OpenCOR]/src/mainwindow.h``
   .. _mainwindow.h: https://github.com/opencor/opencor/tree/master/src/mainwindow.h

Plugins
-------

A file called ``[PluginName]_xx.ts`` must be created for each plugin that requires internationalisation and it must be located in ``[PluginName]/i18n`` (e.g. |Core_fr.ts|_; see `here <http://doc.qt.io/qt-5/linguist-ts-file-format.html>`__ for more information on the TS file format):

.. code-block:: xml

   <?xml version="1.0" encoding="utf-8"?>
   <!DOCTYPE TS>
   <TS version="2.1" language="xx_XX" sourcelanguage="en_GB">
   <context>
   </context>
   </TS>

.. |Core_fr.ts| replace:: ``[OpenCOR]/src/plugins/miscellaneous/Core/i18n/Core_fr.ts``
.. _Core_fr.ts: https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/i18n/Core_fr.ts

A ``[PluginName]_i18n.qrc.in`` file must also be created in ``[PluginName]/res`` (e.g. |Core_i18n.qrc.in|_; ``PLUGIN_NAME`` and ``PROJECT_BUILD_DIR`` are automatically replaced during the build process):

.. code-block:: xml

   <RCC>
       <qresource prefix="/">
           <file alias="${PLUGIN_NAME}_xx">${PROJECT_BUILD_DIR}/${PLUGIN_NAME}_xx.qm</file>
       </qresource>
   </RCC>

.. |Core_i18n.qrc.in| replace:: ``[OpenCOR]/src/plugins/miscellaneous/Core/res/Core_i18n.qrc.in``
.. _Core_i18n.qrc.in: https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/res/Core_i18n.qrc.in

A plugin requires a :ref:`plugin class <develop_plugins_index_pluginClass>` and for internationalisation to be supported, it needs to inherit from |I18nInterface|_, as well as reference ``OpenCOR::I18nInterface`` and include the |i18ninterface.inl|_ file (e.g. |coreplugin.h|_):

.. code-block:: c++

   ...
   class PluginNamePlugin : ..., public I18nInterface, ...
   {
       ...
       Q_INTERFACES(OpenCOR::I18nInterface)
       ...

   public:
   ...
   #include "i18ninterface.inl"
   ...
   };
   ...

.. |I18nInterface| replace:: ``I18nInterface``
.. _I18nInterface: https://github.com/opencor/opencor/blob/master/src/plugins/i18ninterface.h

.. |i18ninterface.inl| replace:: ``i18ninterface.inl``
.. _i18ninterface.inl: https://github.com/opencor/opencor/blob/master/src/plugins/i18ninterface.inl

.. |coreplugin.h| replace:: ``[OpenCOR]/src/plugins/miscellaneous/Core/src/coreplugin.h``
.. _coreplugin.h: https://github.com/opencor/opencor/blob/master/src/plugins/miscellaneous/Core/src/coreplugin.h

The internationalisation interface has only one method that needs to be implemented (e.g. |coreplugin.cpp|_):

.. code-block:: c++

   ...
   //==============================================================================
   // I18n interface
   //==============================================================================

   void PluginNamePlugin::retranslateUi()
   {
       ...
   }
   ...

.. |coreplugin.cpp| replace:: ``[OpenCOR]/src/plugins/miscellaneous/Core/src/coreplugin.cpp``
.. _coreplugin.cpp: https://github.com/opencor/opencor/blob/master/src/plugins/miscellaneous/Core/src/coreplugin.cpp

Qt objects (e.g. menus, actions) need to be retranslated either by the plugin class itself or by an object owned directly or indirectly by the plugin class (e.g. |coreplugin.cpp|_).
To help with this process, |I18nInterface|_ comes with two methods that ensure that menus and actions get properly retranslated: ``retranslateMenu(QMenu *pMenu, const QString &pTitle)`` and ``retranslateAction(QAction *pAction, const QString &pText, const QString &pStatusTip)``.

It may happen that a plugin does not own any Qt objects, but still needs to support internationalisation.
This is the case with our `Editor <https://github.com/opencor/opencor/tree/master/src/plugins/widget/EditorWidget>`__ widget, which implements a Qt widget that can be both instantiated and retranslated by others.
This means that its ``retranslateUi()`` method is empty (see |editorwidgetplugin.cpp|_).

.. |editorwidgetplugin.cpp| replace:: ``[OpenCOR]/src/plugins/widget/EditorWidget/src/editorwidgetplugin.cpp``
.. _editorwidgetplugin.cpp: https://github.com/opencor/opencor/blob/master/src/plugins/widget/EditorWidget/src/editorwidgetplugin.cpp
