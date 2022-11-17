.. _develop_index:

=========
 Develop
=========

The best way to familiarise yourself with the internals of OpenCOR is by having a look at its `source code <https://github.com/opencor/opencor>`__.

Namespace
---------

All of the source code is and must be made available under the ``OpenCOR`` namespace (e.g., |src/mainwindow.cpp|_ and |src/mainwindow.h|_).
There are only two exceptions to this rule: |src/main.cpp|_ and |src/windows/main.cpp|_ (i.e. OpenCOR's two main ``.cpp`` files).

.. |src/mainwindow.cpp| replace:: ``[OpenCOR]/src/mainwindow.cpp``
.. _src/mainwindow.cpp: https://github.com/opencor/opencor/blob/master/src/mainwindow.cpp

.. |src/mainwindow.h| replace:: ``[OpenCOR]/src/mainwindow.h``
.. _src/mainwindow.h: https://github.com/opencor/opencor/blob/master/src/mainwindow.h

.. |src/main.cpp| replace:: ``[OpenCOR]/src/main.cpp``
.. _src/main.cpp: https://github.com/opencor/opencor/blob/master/src/main.cpp

.. |src/windows/main.cpp| replace:: ``[OpenCOR]/src/windows/main.cpp``
.. _src/windows/main.cpp: https://github.com/opencor/opencor/blob/master/src/windows/main.cpp

Issues
------

All changes to the source code must be referenced in the list of `issues <https://github.com/opencor/opencor/issues>`__ using `labels <https://github.com/opencor/opencor/labels>`__ to:

- Request a |feature| for or an |improvement| to a future version of OpenCOR.
- Report a |bug| or a |regression| issue with the current official version of OpenCOR.
- Specify a |task| that needs to be carried out for the next official version of OpenCOR.
- Specify the binding (|python|) associated with a |bug|, |task|, or |regression| issue.
- Specify the platform(s) (|windows|, |linux|, and/or |macos|) associated with a |bug|, |task|, or |regression| issue.

.. |bug| image:: pics/bug.svg
   :class: label

.. |feature| image:: pics/feature.svg
   :class: label

.. |improvement| image:: pics/improvement.svg
   :class: label

.. |linux| image:: pics/linux.svg
   :class: label

.. |macos| image:: pics/macos.svg
   :class: label

.. |python| image:: pics/python.svg
   :class: label

.. |regression| image:: pics/regression.svg
   :class: label

.. |task| image:: pics/task.svg
   :class: label

.. |windows| image:: pics/windows.svg
   :class: label

Continuous integration
----------------------

Whenever something is pushed to the `Git repository <https://github.com/opencor/opencor>`__, OpenCOR gets automatically `built and tested <https://github.com/opencor/opencor/actions>`__ on `Windows <https://en.wikipedia.org/wiki/Microsoft_Windows>`__, `Linux <https://en.wikipedia.org/wiki/Linux>`__ and `macOS <https://en.wikipedia.org/wiki/MacOS>`__, through `GitHub Actions <https://github.com/features/actions>`__.

Anyone wanting to contribute to OpenCOR should first fork the `Git repository <https://github.com/opencor/opencor>`__.
Work for issue ``#XXX`` should then be done in a branch called ``issueXXX``.
The work done, a pull request should be created.
This will trigger OpenCOR to be `built and tested <https://github.com/opencor/opencor/actions>`__.
Assuming everything goes well, the `project manager <https://opencor.ws/team.html>`__ will decide whether to merge the pull request.

Additional information
----------------------

More specific information can be found in the following pages:

- :ref:`develop_codingStyle`
- :ref:`develop_plugins_index`

  - :ref:`develop_plugins_sample`
  - :ref:`develop_plugins_sampleTools`
  - :ref:`develop_plugins_sampleView`
  - :ref:`develop_plugins_sampleWindow`

- :ref:`develop_internationalisation`
- :ref:`develop_tests`
