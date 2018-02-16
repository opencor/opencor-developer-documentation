.. _develop_codingStyle:

==============
 Coding style
==============

This page contains various rules, which anyone working on OpenCOR should (try to) respect.
These rules were taken (paraphrased, if not simply copied/pasted) from the `Qt Coding Style <https://wiki.qt.io/Qt_Coding_Style>`_ document.

General
-------

- The most important rule of all: the `KISS principle <https://en.wikipedia.org/wiki/KISS_principle>`_, i.e. *Keep it simple, stupid!*
  Always use a simple implementation in favour of a more complicated one.
  This eases maintenance a lot!
- Write good C++ code: readable, well commented when necessary, and object-oriented.
- Adapt the code to the structures already existing in OpenCOR or, in the case that you have better ideas, discuss them with the `lead developer <http://localhost/team.html>`_ before implementing them.
- Take advantage of `Qt <https://www.qt.io/>`_. Do not re-invent the wheel.

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

     ++i;
     --j;

  .. code-block:: c++

     i++;
     j--;

- Try to minimise evaluation of the same code over and over.
  This is aimed especially at loops:

  .. code-block:: c++

     for (Container::iterator iter = large.begin(), end = large.end(); iter != end; ++iter) {
         ...
     }

  .. code-block:: c++

     for (Container::iterator iter = large.begin(); iter != large.end(); ++iter) {
         ...
     }

- You can use the Qt ``foreach`` loop in non-time-critical code with a Qt container.
  It is a nice way to keep line noise down and to give the loop variable a proper name:

  .. code-block:: c++

     foreach (QWidget *widget, container)
         doSomething(widget);

  .. code-block:: c++

     for (Container::iterator iter = container.begin(), end = container.end(); iter != end; ++iter)
         doSomething(*iter);

  Make the loop variable ``const``, if possible.
  This might prevent unnecessary detaching of shared data.

  .. code-block:: c++

     foreach (const QString &name, someListOfNames)
         doSomething(name);

  .. code-block:: c++

     foreach (QString name, someListOfNames)
         doSomething(name);

Formatting
----------

- Indentation: 4 spaces, no tabulations.
- **Naming rules:**

  - Use descriptive, simple and short names.
  - Single character variable names are only okay for counters and temporaries where the purpose of the variable is obvious.

    .. code-block:: c++

       int width;
       int height;
       char *nameOfThis;
       char *nameOfThat;

    .. code-block:: c++

       int a, b;
       char *c, *d;

  - Class names and enums start with an upper-case letter while variables and functions start with a lower-case letter.
    Each consecutive word in a name starts with an upper-case letter.

    .. code-block:: c++

       class MainWindow : public QMainWindow
       {
           ...
           int mVariable;
           ...
           void function();
           ...
       }

    .. code-block:: c++

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

       int main(int pArgC, char *pArgV[])
       {
           int someVariable;
           ...
       }

    .. code-block:: c++

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

       int width;
       int height;

    .. code-block:: c++

       int width, height;

    This is especially important when initialisation is done at the same time:

    .. code-block:: c++

       QString firstName = "Joe";
       QString lastName = "Foo";

    .. code-block:: c++

       QString firstName = "Joe", lastName = "Foo";

    **Note:** ``QString firstName = "Joe";`` is formally calling a copy constructor on a temporary string constructed from a string literal and therefore has the potential of being more expensive than direct construction by ``QString firstName("joe")``.
    However, the compiler is allowed to elide the copy (even if it has side effects), and modern compilers typically do so.
    Given these equal costs, OpenCOR code favours the ``=`` idiom as it is in line with the traditional C-style initialisation, and cannot be mistaken as a function declaration, and reduces the level of nested parantheses in more initialisations.

- Pointers and references:

  .. code-block:: c++

     char *ptr = "flop";
     char &c = *ptr;

  .. code-block:: c++

     char* ptr = "flop";
     char & c = * ptr;

  Also, we will have:

  .. code-block:: c++

     const char *ptr;

  .. code-block:: c++

     char const * ptr;

  Using a plain ``0`` for ``NULL`` pointer constants is always correct and least effort to type. So:

  .. code-block:: c++

     void *ptr = 0;

  .. code-block:: c++

     void *ptr = NULL;
     void *ptr = '\0';
     void *ptr = 42-7*6;

- **Whitespace:**

  - Use blank lines to group statements together where suited.
  - Always use only one blank line.
  - Operator names and parentheses: do not use spaces between operator names and function names.
    The ``==`` is part of the function name, and therefore, spaces make the declaration look like an expression:

    .. code-block:: c++

       operator==(type)

    .. code-block:: c++

       operator == (type)

  - Function names and parentheses: do not use spaces between function names and parentheses:

    .. code-block:: c++

       void mangle()

    .. code-block:: c++

       void mangle ()

  - Always use a single space after a keyword, and before a curly brace:

    .. code-block:: c++

       if (foo) {
       }

    .. code-block:: c++

       if(foo){
       }

  - For pointers or references, always use a single space before ``*`` or ``&``, but never after.

    .. code-block:: c++

       int *var1;
       int &var2;

    .. code-block:: c++

       int* var1;
       int& var2;

- **Braces:**

  - As a base rule, place the left curly brace on the same line as the start of the statement:

    .. code-block:: c++

       if (codec) {
       }

    .. code-block:: c++

       if (codec)
       {
       }

    **Exception:** function implementations and class declarations always have the left curly brace in the beginning of a line:

    .. code-block:: c++

       static void foo()
       {
       }

    .. code-block:: c++

       static void foo() {
       }

    .. code-block:: c++

       class Moo
       {
       };

    .. code-block:: c++

       class Moo {
       };

  - Use curly braces when the body of a conditional statement contains more than one line, and also if a single line statement is somewhat complex.
    Otherwise, omit them:

    .. code-block:: c++

       if (address.isEmpty())
           return false;

    .. code-block:: c++

       if (address.isEmpty()) {
           return false;
       }

    .. code-block:: c++

       for (int i = 0; i < 10; ++i)
           qDebug("%d", i);

    .. code-block:: c++

       for (int i = 0; i < 10; ++i) {
           qDebug("%d", i);
       }

    **Exception #1:** use braces also if the parent statement covers several lines or if it wraps:

    .. code-block:: c++

       if (   address.isEmpty()
           || !isValid()
           || !codec) {
           return false;
       }

    .. code-block:: c++

       if (   address.isEmpty()
           || !isValid()
           || !codec)
           return false;

    **Exception #2:** use braces also in ``if-then-else`` blocks where either the ``if`` code or the ``else`` code covers several lines:

    .. code-block:: c++

       if (address.isEmpty()) {
           --it;
       } else {
           qDebug("%s", qPrintable(address));
           ++it;
       }

    .. code-block:: c++

       if (address.isEmpty())
           --it;
       else {
           qDebug("%s", qPrintable(address));
           ++it;
       }

    .. code-block:: c++

       if (cond1) {
           if (cond2)
               ...
           else
               ...
       }

    .. code-block:: c++

       if (cond1)
           if (cond2)
               ...
           else
               ...

  - Use curly braces when the body of a conditional statement is empty:

    .. code-block:: c++

       while (cond) {}

    .. code-block:: c++

       while (cond);

- Parentheses: use parentheses to group expressions:

  .. code-block:: c++

     if ((cond1 && cond2) || cond3)

  .. code-block:: c++

     if (cond1 && cond2 || cond3)

  .. code-block:: c++

     (var1+var2) & var3

  .. code-block:: c++

     var1+var2 & var3

- **Line Breaks:**

  - Keep lines shorter than 80 characters whenever possible.
    **Note:** `Qt Creator <https://www.qt.io/ide/>`_ can be configured to display a right margin by selecting the ``Tools`` | ``Options...`` menu, then the ``Text Editor`` section, and finally the ``Display`` tab under the ``Text Wrapping`` group box.
  - Insert line breaks if necessary.
  - Commas go at the end of a broken line.
  - Operators start at the beginning of a new line.

    .. code-block:: c++

       if (   longExpression
           || otherLongExpression
           || otherOtherLongExpression) {
       }

    .. code-block:: c++

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
- If you create a new set of ``.cpp``/``.h`` files, then top of those files should include a comment common to both files.
- **Including headers:**

  - Arrange headers in alphabetic order within a block:

    .. code-block:: c++

       #include <QCoreApplication>
       #include <QMessageBox>
       #include <QSettings>

    .. code-block:: c++

       #include <QSettings>
       #include <QCoreApplication>
       #include <QMessageBox>

  - Arrange includes in an order that goes from specific (to OpenCOR) to generic to ensure that the headers are self-contained.
    For example:

    .. code-block:: c++

       #include "common.h"
       #include "utils.h"

       #include <QCoreApplication>
       #include <QFileInfo>

       #include <QxtCommandOptions>

       #include <iostream>

  - Enclose headers from other plugins in ``<>`` rather than ``""`` to make it easier to spot external dependencies in the sources.

    .. code-block:: c++

       #include <QxtCommandOptions>

    .. code-block:: c++

       #include "QxtCommandOptions"

  - Prefer direct includes whenever possible:

    .. code-block:: c++

       #include <QFileInfo>

    .. code-block:: c++

       #include <QCore/QFileInfo>

- **Casting:**

  - Avoid C casts, prefer C++ casts (``static_cast``, ``const_cast``, ``reinterpret_cast``). Both ``reinterpret_cast`` and C-style casts are dangerous, but at least ``reinterpret_cast`` will not remove the const modifier.
  - Do not use ``dynamic_cast``, use ``qobject_cast`` for ``QObject``, or refactor your design, for example by introducing a ``type()`` method (see ``QListWidgetItem``), unless you know what you are doing.

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

       // The default constructor needs to be run to initialize x

       static const QString x;

       // The constructor that takes a const char * has to be run

       static const QString s = "Hello, World!";

       // The call time of foo() is undefined and might not be called at all

       static const int i = foo();

    Things you can do:

    .. code-block:: c++

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

    **Note #2:** using `Qt <https://www.qt.io/>`_ 5 and `C++11 <https://en.wikipedia.org/wiki/C++11>`_, it is now possible to (indirectly) have a ``static const QString`` (see here for more information on ``QString``), thus making it possible for a variable to be both read-only and sharable.

    .. code-block:: c++

       static const auto s = QStringLiteral("Hello, World!");

    .. code-block:: c++

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

       for (Container::const_iterator iter = c.constBegin(), end = c.constEnd(); iter != end; ++iter)

    .. code-block:: c++

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

OpenCOR specific
----------------

- Do not use ``inline`` functions.
  It is probably better to rely on the compiler to optimise the code, if necessary, not to mention that, if badly used, ``inline`` functions can result in slower code.
  A good resource on the topic can be found `here <http://yosefk.com/c++fqa/inline.html>`_.
- Divisions are costly, so replace them with multiplications wherever possible:

  .. code-block:: c++

     a = 0.5*b;

  .. code-block:: c++

     a = b/2.0;

- Use a reference rather than a pointer to pass a variable to a function, if you want that variable to be changed:

  .. code-block:: c++

     void function(int &pVar)
     {
         pVar = 3;
     }

  .. code-block:: c++

     void function(int *pVar)
     {
         *pVar = 3;
     }

- Use a constant reference to pass a variable to a function, if you do not intend to modify that variable:

  .. code-block:: c++

     int function(const int &pVar)
     {
         return 3*pVar;
     }

  .. code-block:: c++

     void function(int pVar)
     {
         return 3*pVar;
     }
