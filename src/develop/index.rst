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

All changes to the source code must be referenced in the list of `issues <https://github.com/opencor/opencor/issues>`__ using `labels <https://github.com/opencor/opencor/labels>`__. There are three types of labels:

- **Version:** they are used to request a |feature| for or an |improvement| to a future version of OpenCOR, or to report a |bug| with the current official version of OpenCOR.
- **Development:** they are used to specify a |task| that needs to be carried out (in preparation for the next version of OpenCOR) or to report a |regression| issue with the current development version of OpenCOR.
- **Platform:** they are used to specify the platform(s) (|windows|, |linux| and/or |macos|) affected by a |bug|, |task| or |regression| issue.

.. |bug| image:: pics/bug.svg
.. |feature| image:: pics/feature.svg
.. |improvement| image:: pics/improvement.svg
.. |linux| image:: pics/linux.svg
.. |macos| image:: pics/macos.svg
.. |regression| image:: pics/regression.svg
.. |task| image:: pics/task.svg
.. |windows| image:: pics/windows.svg

Continuous integration
----------------------

Whenever something is pushed to the `master branch <https://github.com/opencor/opencor/tree/master>`__, OpenCOR gets automatically built and tested on `Travis CI <https://travis-ci.org/opencor/opencor>`__'s `Ubuntu <https://docs.travis-ci.com/user/ci-environment/>`__ and `macOS <https://docs.travis-ci.com/user/osx-ci-environment/>`__ machines.
That is, unless ``[ci skip]`` has been added to a commit message, although a commit that closes an issue should always result in OpenCOR being built and tested on `Travis CI <https://travis-ci.org/opencor/opencor>`__.

However, it is not recommended to work directly on the `master branch <https://github.com/opencor/opencor/tree/master>`__.
Instead, anyone wanting to contribute to OpenCOR should first fork its `Git repository <https://github.com/opencor/opencor>`__.
Then, a new branch called ``issueXXX`` should be created for issue ``#XXX``.
It will contain the work associated with issue ``XXX``.
The work completed, a pull request should be made.
This pull request will trigger OpenCOR to be built and tested on `Travis CI <https://travis-ci.org/opencor/opencor>`__.
Assuming it all goes fine, it will then be up to the `project manager <http://localhost/team.html>`__ to merge the work.

Upon merging a pull request, OpenCOR will also be built and tested through `Jenkins <http://autotest.bioeng.auckland.ac.nz/jenkins/view/OpenCOR/>`__ at the `Auckland Bioengineering Institute <https://www.auckland.ac.nz/en/abi.html>`__, and this on `Windows <http://autotest.bioeng.auckland.ac.nz/jenkins/job/OpenCOR_Windows/>`__, `Linux <http://autotest.bioeng.auckland.ac.nz/jenkins/job/OpenCOR_Linux/>`__ and `macOS <http://autotest.bioeng.auckland.ac.nz/jenkins/job/OpenCOR_macOS/>`__.

Additional information
----------------------

More specific information can be found in the following pages:

.. toctree::
   :maxdepth: 1

   codingStyle
   plugins/index
   internationalisation
   tests
