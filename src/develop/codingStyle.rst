.. _develop_codingStyle:

==============
 Coding style
==============

This page contains various rules, which anyone working on OpenCOR should respect.
These rules were taken (paraphrased, if not simply copied/pasted) from the `Coding Conventions <https://wiki.qt.io/Coding_Conventions>`__ document.

General
-------

- The most important rule of all: the `KISS principle <https://en.wikipedia.org/wiki/KISS_principle>`__, i.e. *Keep it simple, stupid!*
  Always use a simple implementation in favour of a more complicated one.
  This eases maintenance a lot!
- Write good C++ code: readable, well commented when necessary, and object-oriented.
- Adapt the code to the structures already existing in OpenCOR or, in the case that you have better ideas, discuss them with the `project manager <http://www.opencor.ws/team.html>`__ before implementing them.
- Take advantage of `Qt <https://www.qt.io/>`__. Do not re-invent the wheel.

Code constructs
---------------

The following guidelines exist to make the code faster, clearer, and/or to take advantage of the strong type checking in C++.

- Declaration of variables should wait as long as possible.
  The rule is: *do not declare it until you need it*.
  In C++, there are a lot of user defined types, and these can very often be expensive to initialise.
- Make the scope of a variable as small as possible.
- Prefer pre-increment to post-increment whenever possible.
  Pre-increment has potential of being faster than post-increment.
  This rule applies to decrement too.

  .. code-block:: c++
     :class: good

     ++i;
     --j;

  .. code-block:: c++
     :class: bad

     i++;
     j--;

- Try to minimise evaluation of the same code over and over.
  This is aimed especially at loops:

  .. code-block:: c++
     :class: good

     for (Container::iterator iter = large.begin(), end = large.end(); iter != end; ++iter) {
         ...
     }

  .. code-block:: c++
     :class: bad

     for (Container::iterator iter = large.begin(); iter != large.end(); ++iter) {
         ...
     }

- You can use the Qt ``foreach`` loop in non-time-critical code with a Qt container.
  It is a nice way to keep line noise down and to give the loop variable a proper name:

  .. code-block:: c++
     :class: good

     foreach (QWidget *widget, container)
         doSomething(widget);

  .. code-block:: c++
     :class: bad

     for (Container::iterator iter = container.begin(), end = container.end(); iter != end; ++iter)
         doSomething(*iter);

  Make the loop variable ``const``, if possible.
  This might prevent unnecessary detaching of shared data.

  .. code-block:: c++
     :class: good

     foreach (const QString &name, someListOfNames)
         doSomething(name);

  .. code-block:: c++
     :class: bad

     foreach (QString name, someListOfNames)
         doSomething(name);

Formatting
----------

- Indentation: 4 spaces, no tabulations.
- **Naming rules:**

  - Use descriptive, simple and short names.
  - Single character variable names are only okay for counters and temporaries where the purpose of the variable is obvious.

    .. code-block:: c++
       :class: good

       int width;
       int height;
       char *nameOfThis;
       char *nameOfThat;

    .. code-block:: c++
       :class: bad

       int a, b;
       char *c, *d;

  - Class names and enums start with an upper-case letter while variables and functions start with a lower-case letter.
    Each consecutive word in a name starts with an upper-case letter.

    .. code-block:: c++
       :class: good

       class MainWindow : public QMainWindow
       {
           ...
           int mVariable;
           ...
           void function();
           ...
       }

    .. code-block:: c++
       :class: bad

       class mainWindow : public QMainWindow
       {
           ...
           int Variable;
           ...
           void Function();
           ...
       }

    **Note:** class variables start with a lower-case ``m``.

  - Parameters passed to a function start with a lower-case ``p``, but not local variables.

    .. code-block:: c++
       :class: good

       int main(int pArgC, char *pArgV[])
       {
           int someVariable;
           ...
       }

    .. code-block:: c++
       :class: bad

       int main(int argc, char *argv[])
       {
           int pSomeVariable;
           ...
       }

- **Declarations:**

  - Use this order for the access sections of your class: ``public``, ``protected`` and ``private``.
    The ``public`` section is interesting for every user of the class.
    The ``private`` section is only of interest for the implementors of the class (you).
  - Avoid declaring global objects in the declaration file of the class.
    If the same variable is used for all objects, use a ``static`` member.
  - Avoid declaring global or static variables.
  - Use only one declaration per line:

    .. code-block:: c++
       :class: good

       int width;
       int height;

    .. code-block:: c++
       :class: bad

       int width, height;

    This is especially important when initialisation is done at the same time:

    .. code-block:: c++
       :class: good

       QString firstName = "Joe";
       QString lastName = "Foo";

    .. code-block:: c++
       :class: bad

       QString firstName = "Joe", lastName = "Foo";

    **Note:** ``QString firstName = "Joe";`` is formally calling a copy constructor on a temporary string constructed from a string literal and therefore has the potential of being more expensive than direct construction by ``QString firstName("joe")``.
    However, the compiler is allowed to elide the copy (even if it has side effects), and modern compilers typically do so.
    Given these equal costs, OpenCOR code favours the ``=`` idiom as it is in line with the traditional C-style initialisation, and cannot be mistaken as a function declaration, and reduces the level of nested parantheses in more initialisations.

- Pointers and references:

  .. code-block:: c++
     :class: good

     char *ptr = "flop";
     char &c = *ptr;

  .. code-block:: c++
     :class: bad

     char* ptr = "flop";
     char & c = * ptr;

  Also, we will have:

  .. code-block:: c++
     :class: good

     const char *ptr;

  .. code-block:: c++
     :class: bad

     char const * ptr;

  Using a plain ``0`` for ``NULL`` pointer constants is always correct and least effort to type. So:

  .. code-block:: c++
     :class: good

     void *ptr = 0;

  .. code-block:: c++
     :class: bad

     void *ptr = NULL;
     void *ptr = '\0';
     void *ptr = 42-7*6;

- **Whitespace:**

  - Use blank lines to group statements together where suited.
  - Always use only one blank line.
  - Operator names and parentheses: do not use spaces between operator names and function names.
    The ``==`` is part of the function name, and therefore, spaces make the declaration look like an expression:

    .. code-block:: c++
       :class: good

       operator==(type)

    .. code-block:: c++
       :class: bad

       operator == (type)

  - Function names and parentheses: do not use spaces between function names and parentheses:

    .. code-block:: c++
       :class: good

       void mangle()

    .. code-block:: c++
       :class: bad

       void mangle ()

  - Always use a single space after a keyword, and before a curly brace:

    .. code-block:: c++
       :class: good

       if (foo) {
       }

    .. code-block:: c++
       :class: bad

       if(foo){
       }

  - For pointers or references, always use a single space before ``*`` or ``&``, but never after.

    .. code-block:: c++
       :class: good

       int *var1;
       int &var2;

    .. code-block:: c++
       :class: bad

       int* var1;
       int& var2;

- **Braces:**

  - As a base rule, place the left curly brace on the same line as the start of the statement:

    .. code-block:: c++
       :class: good

       if (codec) {
       }

    .. code-block:: c++
       :class: bad

       if (codec)
       {
       }

    **Exception:** function implementations and class declarations always have the left curly brace in the beginning of a line:

    .. code-block:: c++
       :class: good

       class Moo
       {
       };

    .. code-block:: c++
       :class: bad

       class Moo {
       };

    .. code-block:: c++
       :class: good

       void Moo::foo()
       {
       }

    .. code-block:: c++
       :class: bad

       void Moo::foo() {
       }

  - Use curly braces when the body of a conditional statement contains more than one line, and also if a single line statement is somewhat complex.
    Otherwise, omit them:

    .. code-block:: c++
       :class: good

       if (address.isEmpty())
           return false;

    .. code-block:: c++
       :class: bad

       if (address.isEmpty()) {
           return false;
       }

    .. code-block:: c++
       :class: good

       for (int i = 0; i < 10; ++i)
           qDebug("%d", i);

    .. code-block:: c++
       :class: bad

       for (int i = 0; i < 10; ++i) {
           qDebug("%d", i);
       }

    **Exception #1:** use braces if the parent statement covers several lines or if it wraps:

    .. code-block:: c++
       :class: good

       if (    address.isEmpty()
           || !isValid()
           || !codec) {
           return false;
       }

    .. code-block:: c++
       :class: bad

       if (    address.isEmpty()
           || !isValid()
           || !codec)
           return false;

    **Exception #2:** use braces in ``if-then-else`` statements when either the ``if`` or ``else`` block covers several lines:

    .. code-block:: c++
       :class: good

       if (address.isEmpty()) {
           --it;
       } else {
           qDebug("%s", qPrintable(address));

           ++it;
       }

    .. code-block:: c++
       :class: bad

       if (address.isEmpty())
           --it;
       else {
           qDebug("%s", qPrintable(address));

           ++it;
       }

    .. code-block:: c++
       :class: good

       if (cond1) {
           if (cond2)
               ...
           else
               ...
       }

    .. code-block:: c++
       :class: bad

       if (cond1)
           if (cond2)
               ...
           else
               ...

  - Use curly braces when the body of a conditional statement is empty:

    .. code-block:: c++
       :class: good

       while (cond) {}

    .. code-block:: c++
       :class: bad

       while (cond);

- Parentheses: use parentheses to group expressions:

  .. code-block:: c++
     :class: good

     if ((cond1 && cond2) || cond3)

  .. code-block:: c++
     :class: bad

     if (cond1 && cond2 || cond3)

  .. code-block:: c++
     :class: good

     (var1+var2) & var3

  .. code-block:: c++
     :class: bad

     var1+var2 & var3

- **Line Breaks:**

  - Keep lines shorter than 80 characters whenever possible.

    **Note:** `Qt Creator <https://www.qt.io/ide/>`__ can be configured to display a right margin.
    For this, select the ``Tools`` | ``Options...`` menu, then the ``Text Editor`` section, and finally the ``Display`` tab.
    Configuration options can be found under the ``Text Wrapping`` group box.

  - Insert line breaks if necessary.
  - Commas go at the end of a broken line.
  - Operators start at the beginning of a new line.

    .. code-block:: c++
       :class: good

       if (   longExpression
           || otherLongExpression
           || otherOtherLongExpression) {
       }

    .. code-block:: c++
       :class: bad

       if (longExpression ||
           otherLongExpression ||
           otherOtherLongExpression) {
       }

Patterns and practices
----------------------

- Do not use exceptions, unless you know what you are doing.
- Do not use RTTI (Run-Time Type Information, i.e. the ``typeinfo struct``, the ``dynamic_cast`` or the ``typeid`` operators, including throwing exceptions), unless you know what you are doing.
- Use templates wisely, not just because you can.
- Every ``QObject`` subclass must have a ``Q_OBJECT`` macro, even if it does not have signals or slots, if it is intended to be used with ``qobject_cast<>``.
- If you create a new set of ``.cpp``/``.h`` files, then our copyright statement and a comment common to both files should be included at the beginning of those files (e.g. |mainwindow.cpp|_ and |mainwindow.h|_).
- **Including headers:**

  - Arrange headers in alphabetic order within a block:

    .. code-block:: c++
       :class: good

       #include <QCoreApplication>
       #include <QMessageBox>
       #include <QSettings>

    .. code-block:: c++
       :class: bad

       #include <QSettings>
       #include <QCoreApplication>
       #include <QMessageBox>

  - Arrange includes in blocks of headers that are specific to OpenCOR, `Qt <https://www.qt.io/>`__, third-party libraries and C++.
    For example:

    .. code-block:: c++

       #include "coreguiutils.h"
       #include "filemanager.h"

       #include <QApplication>
       #include <QMainWindow>

       #include "qwt_mml_document.h"
       #include "qwt_wheel.h"

       #include <string>
       #include <vector>

  - Prefer direct includes whenever possible:

    .. code-block:: c++
       :class: good

       #include <QFileInfo>

    .. code-block:: c++
       :class: bad

       #include <QCore/QFileInfo>

- **Casting:**

  - Avoid C casts, prefer C++ casts (``static_cast``, ``const_cast``, ``reinterpret_cast``). Both ``reinterpret_cast`` and C-style casts are dangerous, but at least ``reinterpret_cast`` will not remove the const modifier.
  - Do not use ``dynamic_cast``, use ``qobject_cast`` for ``QObject``, or refactor your design, for example by introducing a ``type()`` method (see |QListWidgetItem|_), unless you know what you are doing.

- **Compiler and platform-specific issues:**

  - Be extremely careful when using the question mark operator.
    If the returned types are not identical, some compilers generate code that crashes at runtime (you will not even get a compiler warning):

    .. code-block:: c++

       QString str;

       return condition?str:"nothing";   // Crash at runtime - QString vs const char *

  - Be extremely careful about alignment.
    Whenever a pointer is cast such that the required alignment of the target is increased, the resulting code might crash at runtime on some architectures.
    For example, if a ``const char *`` is cast to a ``const int *``, it will crash on machines where integers have to be aligned at two-byte or four-byte boundaries.
    Use a union to force the compiler to align variables correctly.
    In the example below, you can be sure that all instances of ``AlignHelper`` are aligned at integer-boundaries:

    .. code-block:: c++

       union AlignHelper
       {
           char c;
           int i;
       };

  - Anything that has a constructor or needs to run code to be initialised cannot be used as global object in library code since it is undefined when that constructor or code will be run (on first usage, on library load, before ``main()`` or not at all).
    Even if the execution time of the initialiser is defined for shared libraries, you will get into trouble when moving that code in a plugin or if the library is compiled statically:

    .. code-block:: c++
       :class: bad

       // The default constructor needs to be run to initialize x

       static const QString x;

       // The constructor that takes a const char * has to be run

       static const QString s = "Hello, World!";

       // The call time of foo() is undefined and might not be called at all

       static const int i = foo();

    Things you can do:

    .. code-block:: c++
       :class: good

       // No constructor must be run, x is set at compile time

       static const char x[] = "someText";

       // y will be set at compile time

       static int y = 7;

       // s will be initialised statically, i.e. no code is run

       static MyStruct s = {1, 2, 3};

       // Pointers to objects are OK, no code needs to be run to initialise ptr

       static QString *ptr = 0;

       // Use Q_GLOBAL_STATIC to create static global objects instead

       Q_STATIC_GLOBAL(QString, s)

       void foo()
       {
           s()->append("moo");
       }

    **Note #1:** static objects in function scope are not a problem.
    The constructor will be run the first time the function is entered.
    The code is not re-entrant, though.

    **Note #2:** using `Qt <https://www.qt.io/>`__ 5 and `C++11 <https://en.wikipedia.org/wiki/C++11>`__, it is now possible to (indirectly) have a ``static const QString`` (see `here <https://www.macieira.org/blog/2011/07/qstring-improved/>`__ for more information on ``QString``), thus making it possible for a variable to be both read-only and sharable.

    .. code-block:: c++
       :class: good

       static const auto s = QStringLiteral("Hello, World!");

    .. code-block:: c++
       :class: bad

       static const QString s = "Hello, World!";

  - A ``char`` is signed or unsigned, depending on the architecture. Use ``signed char`` or ``uchar`` if you explicitely want a signed or unsigned char.
    The following code will break on PowerPC, for example:

    .. code-block:: c++

       // The condition is always true on platforms where the default is unsigned

       if (c >= 0) {
           ...
       }

  - Avoid 64-bit enum values.
    The AAPCS (Procedure Call Standard for the ARM Architecture) embedded ABI hard codes all enum values to a 32-bit integer.
  - Do not mix ``const`` and non-``const`` iterators.
    This will silently crash on broken compilers.

    .. code-block:: c++
       :class: good

       for (Container::const_iterator iter = c.constBegin(), end = c.constEnd(); iter != end; ++iter)

    .. code-block:: c++
       :class: bad

       for (Container::const_iterator iter = c.begin(), Container::iterator end = c.end(); iter != end; ++iter)

- Inheriting from template or tool classes: this has the following potential pitfalls:

  - The destructors are not virtual, which can lead to memory leaks.
  - The symbols are not exported (and mostly inline), which can lead to symbol clashes.

  For example, library ``A`` has ``class Q_EXPORT X: public QList<QVariant> {};`` and library ``B`` has ``class Q_EXPORT Y: public QList<QVariant> {};``.
  Suddenly, ``QList`` symbols are exported from two libraries, which results in a clash.

- **Aesthetics:**

  - Put the body of a function in a ``.cpp`` file, not in its ``.h`` file.
    There is a reason for having both a ``.cpp`` file and a ``.h`` file.
  - Prefer ``enum`` to define constants over ``static const int`` or ``#define``.
    Enumeration values will be replaced by the compiler at compile time, resulting in faster code.
    Also, ``#define`` is not namespace safe.

   .. |mainwindow.cpp| replace:: ``[OpenCOR]/src/mainwindow.cpp``
   .. _mainwindow.cpp: https://github.com/opencor/opencor/tree/master/src/mainwindow.cpp

   .. |mainwindow.h| replace:: ``[OpenCOR]/src/mainwindow.h``
   .. _mainwindow.h: https://github.com/opencor/opencor/tree/master/src/mainwindow.h

   .. |QListWidgetItem| replace:: ``QListWidgetItem``
   .. _QListWidgetItem: http://doc.qt.io/qt-5/qlistwidgetitem.html

OpenCOR specific
----------------

- Do not use ``inline`` functions.
  It is probably better to rely on the compiler to optimise the code, if necessary, not to mention that, if badly used, ``inline`` functions can result in slower code.
  A good resource on the topic can be found `here <http://yosefk.com/c++fqa/inline.html>`__.
- Divisions are costly, so replace them with multiplications wherever possible:

  .. code-block:: c++
     :class: good

     a = 0.5*b;

  .. code-block:: c++
     :class: bad

     a = b/2.0;

- Use a reference rather than a pointer to pass a variable to a function, if you want that variable to be changed:

  .. code-block:: c++
     :class: good

     void function(int &pVar)
     {
         pVar = 3;
     }

  .. code-block:: c++
     :class: bad

     void function(int *pVar)
     {
         *pVar = 3;
     }

- Use a constant reference to pass a variable to a function, if you do not intend to modify that variable:

  .. code-block:: c++
     :class: good

     void function(const QString &pVar)
     {
         ...
     }

  .. code-block:: c++
     :class: bad

     void function(QString pVar)
     {
         ...
     }

  unless it is a built-in type:

  .. code-block:: c++
     :class: good

     void function(int pVar)
     {
         ...
     }

  .. code-block:: c++
     :class: bad

     void function(const int &pVar)
     {
         ...
     }
