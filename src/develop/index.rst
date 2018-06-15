.. _develop_index:

=========
 Develop
=========

The best way to familiarise yourself with the internals of OpenCOR is by having a look at its `source code <https://github.com/opencor/opencor>`__.

Namespace
---------

All of the source code is and must be made available under the ``OpenCOR`` namespace (e.g. |src/mainwindow.cpp|_ and |src/mainwindow.h|_).
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

All changes to the source code must be referenced in the list of `issues <https://github.com/opencor/opencor/issues>`__ using `labels <https://github.com/opencor/opencor/labels>`__. There are four types of labels:

- **Version:** it is used to request a |feature| for or an |improvement| to a future version of OpenCOR, or to report a |bug| with the current official version of OpenCOR.
- **Development:** it is used to specify a |task| that needs to be carried out (in preparation for the next version of OpenCOR) or to report a |regression| issue with the current development version of OpenCOR.
- **Binding:** it is used to specify the binding (|python|) associated with a |bug|, |task| or |regression| issue.
- **Platform:** it is used to specify the platform(s) (|windows|, |linux| and/or |macos|) associated with a |bug|, |task| or |regression| issue.

.. |bug| image:: pics/bug.svg
.. |feature| image:: pics/feature.svg
.. |improvement| image:: pics/improvement.svg
.. |linux| image:: pics/linux.svg
.. |macos| image:: pics/macos.svg
.. |python| image:: pics/python.svg
.. |regression| image:: pics/regression.svg
.. |task| image:: pics/task.svg
.. |windows| image:: pics/windows.svg

Continuous integration
----------------------

Whenever something is pushed to the `Git repository <https://github.com/opencor/opencor>`__, OpenCOR gets automatically built and tested on `Windows <https://en.wikipedia.org/wiki/Microsoft_Windows>`__, `Linux <https://en.wikipedia.org/wiki/Linux>`__ and `macOS <https://en.wikipedia.org/wiki/MacOS>`__, through `Jenkins <http://autotest.bioeng.auckland.ac.nz/jenkins/view/OpenCOR/>`__ at the `Auckland Bioengineering Institute <https://www.auckland.ac.nz/en/abi.html>`__.

Although possible, direct work on the `master branch <https://github.com/opencor/opencor/tree/master>`__ is not allowed.
Instead, anyone wanting to contribute to OpenCOR should first fork the `Git repository <https://github.com/opencor/opencor>`__.
Then, a new branch called ``issueXXX`` should be created for issue ``#XXX``.
That branch should contain all the work associated with issue ``XXX``.
Upon work completion, a pull request should be made.
This pull request will trigger OpenCOR to be built and tested on `Jenkins <http://autotest.bioeng.auckland.ac.nz/jenkins/view/OpenCOR/>`__.
Assuming it all goes fine, it will then be up to the `project manager <http://www.opencor.ws/team.html>`__ to merge the work.

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

.. toctree::
   :hidden:

   codingStyle
   plugins/index
   internationalisation
   tests
