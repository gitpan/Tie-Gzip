#!perl
#
# The copyright notice and plain old documentation (POD)
# are at the end of this file.
#
package  Docs::Site_SVD::Tie_Gzip;

use strict;
use warnings;
use warnings::register;

use vars qw($VERSION $DATE $FILE );
$VERSION = '0.04';
$DATE = '2004/04/15';
$FILE = __FILE__;

use vars qw(%INVENTORY);
%INVENTORY = (
    'lib/Docs/Site_SVD/Tie_Gzip.pm' => [qw(0.04 2004/04/15), 'revised 0.03'],
    'MANIFEST' => [qw(0.04 2004/04/15), 'generated, replaces 0.03'],
    'Makefile.PL' => [qw(0.04 2004/04/15), 'generated, replaces 0.03'],
    'README' => [qw(0.04 2004/04/15), 'generated, replaces 0.03'],
    'lib/Tie/Gzip.pm' => [qw(1.13 2004/04/15), 'revised 1.12'],
    't/Tie/Gzip.pm' => [qw(0.03 2004/04/15), 'revised 0.02'],
    't/Tie/Gzip.t' => [qw(0.02 2004/04/15), 'revised 0.01'],
    't/Tie/Gzip.d' => [qw(0.02 2004/04/15), 'revised 0.01'],
    't/Tie/File/Package.pm' => [qw(1.16 2004/04/15), 'new'],
    't/Tie/File/SmartNL.pm' => [qw(1.13 2004/04/15), 'new'],
    't/Tie/Test/Tech.pm' => [qw(1.18 2004/04/15), 'new'],
    't/Tie/Data/Secs2.pm' => [qw(1.16 2004/04/15), 'new'],
    't/Tie/Data/SecsPack.pm' => [qw(0.02 2004/04/15), 'new'],
    't/Tie/Gzip0.htm' => [qw(0.01 2003/09/12), 'unchanged'],

);

########
# The ExtUtils::SVDmaker module uses the data after the __DATA__ 
# token to automatically generate this file.
#
# Don't edit anything before __DATA_. Edit instead
# the data after the __DATA__ token.
#
# ANY CHANGES MADE BEFORE the  __DATA__ token WILL BE LOST
#
# the next time ExtUtils::SVDmaker generates this file.
#
#



=head1 Title Page

 Software Version Description

 for

 Tie::Gzip - gzip with a small memory footprint

 Revision: B

 Version: 0.04

 Date: 2004/04/15

 Prepared for: General Public 

 Prepared by:  SoftwareDiamonds.com E<lt>support@SoftwareDiamonds.comE<gt>

 Copyright: copyright © 2003 Software Diamonds

 Classification: NONE

=head1 1.0 SCOPE

This paragraph identifies and provides an overview
of the released files.

=head2 1.1 Identification

This release,
identified in L<3.2|/3.2 Inventory of software contents>,
is a collection of Perl modules that
extend the capabilities of the Perl language.

=head2 1.2 System overview

The 'Tie::Gzip' module provides a file handle Tie 
for compressing and uncompressing files using
the gzip format.

By tieing a filehandle to 'Tie::Gzip' subsequent uses
of the file subroutines with the tied filehandle will
compress data written to an opened file using gzip compression
and decompress data read from an opened file using gzip
compression.

If the 'Tie::Gzip' tie receives a I<filename> or I<mode filename>
after completing the tie, 'Tie::Gzip' will open I<filename>.

During the tie, Tie::Gzip will first try to load the
'Compress::Zlib' module and package. 
If successful, 'Tie::Gzip' uses the 'Compress::Zlib' for
compressing and decompressing the file data.

If unsuccessful, 'Tie::Gzip' setups up the following pipes
to an anticipated GNU 'gzip' site command for compressing and
decompressing the file data:

 gzip --decompress --stdout {} | # read file data
 | gzip --stdout > {} # write file data

where the string '{}' is a placeholder for the I<filename>.

=head2 1.3 Document overview.

This document releases Tie::Gzip version 0.04
providing a description of the inventory, installation
instructions and other information necessary to
utilize and track this release.

=head1 3.0 VERSION DESCRIPTION

All file specifications in this SVD
use the Unix operating
system file specification.

=head2 3.1 Inventory of materials released.

This document releases the file 

 Tie-Gzip-0.04.tar.gz

found at the following repository(s):

  http://www.softwarediamonds/packages/
  http://www.perl.com/CPAN/authors/id/S/SO/SOFTDIA/

Restrictions regarding duplication and license provisions
are as follows:

=over 4

=item Copyright.

copyright © 2003 Software Diamonds

=item Copyright holder contact.

 603 882-0846 E<lt>support@SoftwareDiamonds.comE<gt>

=item License.

Software Diamonds permits the redistribution
and use in source and binary forms, with or
without modification, provided that the 
following conditions are met: 

=over 4

=item 1

Redistributions of source code, modified or unmodified
must retain the above copyright notice, this list of
conditions and the following disclaimer. 

=item 2

Redistributions in binary form must 
reproduce the above copyright notice,
this list of conditions and the following 
disclaimer in the documentation and/or
other materials provided with the
distribution.

=back

SOFTWARE DIAMONDS, http://www.SoftwareDiamonds.com,
PROVIDES THIS SOFTWARE 
'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES,
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
SHALL SOFTWARE DIAMONDS BE LIABLE FOR ANY DIRECT,
INDIRECT, INCIDENTAL, SPECIAL,EXEMPLARY, OR 
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE,DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING USE OF THIS SOFTWARE, EVEN IF
ADVISED OF NEGLIGENCE OR OTHERWISE) ARISING IN
ANY WAY OUT OF THE POSSIBILITY OF SUCH DAMAGE.

=back

=head2 3.2 Inventory of software contents

The content of the released, compressed, archieve file,
consists of the following files:

 file                                                         version date       comment
 ------------------------------------------------------------ ------- ---------- ------------------------
 lib/Docs/Site_SVD/Tie_Gzip.pm                                0.04    2004/04/15 revised 0.03
 MANIFEST                                                     0.04    2004/04/15 generated, replaces 0.03
 Makefile.PL                                                  0.04    2004/04/15 generated, replaces 0.03
 README                                                       0.04    2004/04/15 generated, replaces 0.03
 lib/Tie/Gzip.pm                                              1.13    2004/04/15 revised 1.12
 t/Tie/Gzip.pm                                                0.03    2004/04/15 revised 0.02
 t/Tie/Gzip.t                                                 0.02    2004/04/15 revised 0.01
 t/Tie/Gzip.d                                                 0.02    2004/04/15 revised 0.01
 t/Tie/File/Package.pm                                        1.16    2004/04/15 new
 t/Tie/File/SmartNL.pm                                        1.13    2004/04/15 new
 t/Tie/Test/Tech.pm                                           1.18    2004/04/15 new
 t/Tie/Data/Secs2.pm                                          1.16    2004/04/15 new
 t/Tie/Data/SecsPack.pm                                       0.02    2004/04/15 new
 t/Tie/Gzip0.htm                                              0.01    2003/09/12 unchanged


=head2 3.3 Changes

Changes are as follows

=over 4

=item Tie::Gzip-0.01

Originated

=item Tie::Gzip-0.02

Installed Mark Scarton's
engineering change request per below e-mail:

From: Mark.Scarton@FranklinCovey.com 
Date: Thu, 19 Feb 2004 17:23:37 -0700 

In the 'lib/Tie/Gzip.pm' module of the Tie-Gzip-0.01 package,
the open of the pipe ("gzip --decompress --stdout |") is
failing due to the reference to $! in the conditional.
As a test, I cleared $! before issuing the open call as follows:

 Line 124:

             ###############
             # Some perls will return a glob and a warning
             # for certain pipe errors such as the command
             # not a recognized command
             #
             $! = 0;    ### MAS ###
             my $success = open PIPE, $pipe;
             if($! || !$success) {
                 warn "Could not pipe $pipe: $!\n";
                 $self->CLOSE;
                 return undef;
             }

 Line 167:

             ###############
             # Some perls will return a glob and a warning
             # for certain pipe errors such as the command
             # not a recognized command
             #
             $! = 0;    ### MAS ###
             my $success = open PIPE, $pipe;
             if($! || !$success) {
                 warn "Could not pipe $pipe: $!\n";
                 $self->CLOSE;
                 return undef;
             }

This works. Prior to making this change, test 6 of Gzip.t would fail.

According to the Learning Perl O'Reilly book, 

"But if you use die to indicate an error that is not the failure of a
system request, don't include $!, since it will generally hold
an unrelated message left over from something Perl did internally.
It will hold a useful value only immediately after a failed system request.
A successful request won't leave anything useful there."

So $! is only sourced when a system error occurs and it is not cleared prior
to the call. If no error occurs, the value is indeterminate.

=item Tie::Gzip-0.03

prerequisite program because loaded the  Data::Secs2 test modules
to tlib\Test instead of tlib\Data.

=item Tie::Gzip-0.04

The lastest build of Test::STDmaker expects the test library in the same
directory as the test script.
Coordiated with the lastest Test::STDmaker by moving the
test library from tlib to t/Tie, the same directory as the test script
and deleting the test library File::TestPath program module.


http://ppm.activestate.com/BuildStatus/5.8-linux/linux-5.8/Tie-Gzip-0.03.txt

has the following failures:

 PERL_DL_NONLAZY=1 /home/cpanrun/tmp/5.8.0/bin/perl "-MExtUtils::Command::MM" "-e" "test_harness(0, 'blib/lib', 'blib/arch')" t/Tie/Gzip.t
 t/Tie/Gzip....Could not pipe | gzip --stdout > Gzip1.htm.gz: Illegal seek
 Could not pipe gzip --decompress --stdout Gzip1.htm.gz |: Illegal seek
 Could not pipe gzip --decompress --stdout Gzip1.htm.gz |: Illegal seek
 # Cannot open <Gzip1.htm
 # Test 9 got: '' (t/Tie/Gzip.t at line 319)
 #   Expected: '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
 <html>

 [snip]

 FAILED test 9
	Failed 1/11 tests, 90.91% okay (less 5 skipped tests: 5 okay, 45.45%)
 Failed 1/1 test scripts, 0.00% okay. 1/11 subtests failed, 90.91% okay.
 Failed Test  Stat Wstat Total Fail  Failed  List of Failed
 -------------------------------------------------------------------------------
 t/Tie/Gzip.t               11    1   9.09%  9
 5 subtests skipped.


The test script is not right and this is a false failure. 
The test script uses the <Test:Tech> 
features to force the C<ok> and C<skip> to perform a skip. 
However, this does not work for Perl code outside the C<ok> and C<skip>
subroutines.  Added test code to skip outside the C<ok> and C<skip> 
subroutines.

=back

=head2 3.4 Adaptation data.

This installation requires that the installation site
has the Perl programming language installed.
There are no other additional requirements or tailoring needed of 
configurations files, adaptation data or other software needed for this
installation particular to any installation site.

=head2 3.5 Related documents.

There are no related documents needed for the installation and
test of this release.

=head2 3.6 Installation instructions.

Instructions for installation, installation tests
and installation support are as follows:

=over 4

=item Installation Instructions.

To installed the release file, use the CPAN module
pr PPM module in the Perl release
or the INSTALL.PL script at the following web site:

 http://packages.SoftwareDiamonds.com

Follow the instructions for the the chosen installation software.

If all else fails, the file may be manually installed.
Enter one of the following repositories in a web browser:

  http://www.softwarediamonds/packages/
  http://www.perl.com/CPAN/authors/id/S/SO/SOFTDIA/

Right click on 'Tie-Gzip-0.04.tar.gz' and download to a temporary
installation directory.
Enter the following where $make is 'nmake' for microsoft
windows; otherwise 'make'.

 gunzip Tie-Gzip-0.04.tar.gz
 tar -xf Tie-Gzip-0.04.tar
 perl Makefile.PL
 $make test
 $make install

On Microsoft operating system, nmake, tar, and gunzip 
must be in the exeuction path. If tar and gunzip are
not install, download and install unxutils from

 http://packages.softwarediamonds.com

=item Prerequistes.

 None.


=item Security, privacy, or safety precautions.

None.

=item Installation Tests.

Most Perl installation software will run the following test script(s)
as part of the installation:

 t/Tie/Gzip.t

=item Installation support.

If there are installation problems or questions with the installation
contact

 603 882-0846 E<lt>support@SoftwareDiamonds.comE<gt>

=back

=head2 3.7 Possible problems and known errors

There are no known open issues.

=head1 4.0 NOTES

The following are useful acronyms:

=over 4

=item .d

extension for a Perl demo script file

=item .pm

extension for a Perl Library Module

=item .t

extension for a Perl test script file

=back

=head1 2.0 SEE ALSO

=over 4

=item Docs::US_DOD::SVD

  http://www.softwarediamonds/packages/  Docs-US_DOD-STD2167A-X.XX.tar.gz
  http://www.perl.com/CPAN/authors/id/S/SO/SOFTDIA/  Docs-US_DOD-STD2167A-X.XX.tar.gz

=back

=for html
<hr>
<p><br>
<!-- BLK ID="NOTICE" -->
<!-- /BLK -->
<p><br>
<!-- BLK ID="OPT-IN" -->
<!-- /BLK -->
<p><br>
<!-- BLK ID="LOG_CGI" -->
<!-- /BLK -->
<p><br>

=cut

1;

__DATA__

DISTNAME: Tie-Gzip^
VERSION : 0.04^
FREEZE: 1^
PREVIOUS_DISTNAME:  ^
PREVIOUS_RELEASE: 0.03 ^
REVISION: B ^

AUTHOR  : SoftwareDiamonds.com E<lt>support@SoftwareDiamonds.comE<gt>^
ABSTRACT: gzip with a small memory footprint^
TITLE   : Tie::Gzip - gzip with a small memory footprint^
END_USER: General Public^
COPYRIGHT: copyright © 2003 Software Diamonds^
CLASSIFICATION: NONE^
TEMPLATE:  ^
CSS: help.css^
SVD_FSPEC: Unix^

REPOSITORY_DIR: packages^
REPOSITORY: 
  http://www.softwarediamonds/packages/
  http://www.perl.com/CPAN/authors/id/S/SO/SOFTDIA/
^

COMPRESS: gzip^
COMPRESS_SUFFIX: gz^

RESTRUCTURE:  ^
CHANGE2CURRENT:  ^

AUTO_REVISE: 
lib/Tie/Gzip.pm
t/Tie/Gzip.pm
t/Tie/Gzip.t
t/Tie/Gzip.d
lib/File/Package.pm => t/Tie/File/Package.pm
lib/File/SmartNL.pm => t/Tie/File/SmartNL.pm
lib/Test/Tech.pm => t/Tie/Test/Tech.pm
lib/Data/Secs2.pm => t/Tie/Data/Secs2.pm
lib/Data/SecsPack.pm => t/Tie/Data/SecsPack.pm
^

REPLACE: t/Tie/Gzip0.htm^

PREREQ_PM:  ^
README_PODS: lib/Tie/Gzip.pm^

TESTS: t/Tie/Gzip.t^
EXE_FILES:  ^

CHANGES: 
Changes are as follows

\=over 4

\=item Tie::Gzip-0.01

Originated

\=item Tie::Gzip-0.02

Installed Mark Scarton's
engineering change request per below e-mail:

From: Mark.Scarton@FranklinCovey.com 
Date: Thu, 19 Feb 2004 17:23:37 -0700 

In the 'lib/Tie/Gzip.pm' module of the Tie-Gzip-0.01 package,
the open of the pipe ("gzip --decompress --stdout |") is
failing due to the reference to $! in the conditional.
As a test, I cleared $! before issuing the open call as follows:

 Line 124:

             ###############
             # Some perls will return a glob and a warning
             # for certain pipe errors such as the command
             # not a recognized command
             #
             $! = 0;    ### MAS ###
             my $success = open PIPE, $pipe;
             if($! || !$success) {
                 warn "Could not pipe $pipe: $!\n";
                 $self->CLOSE;
                 return undef;
             }

 Line 167:

             ###############
             # Some perls will return a glob and a warning
             # for certain pipe errors such as the command
             # not a recognized command
             #
             $! = 0;    ### MAS ###
             my $success = open PIPE, $pipe;
             if($! || !$success) {
                 warn "Could not pipe $pipe: $!\n";
                 $self->CLOSE;
                 return undef;
             }

This works. Prior to making this change, test 6 of Gzip.t would fail.

According to the Learning Perl O'Reilly book, 

"But if you use die to indicate an error that is not the failure of a
system request, don't include $!, since it will generally hold
an unrelated message left over from something Perl did internally.
It will hold a useful value only immediately after a failed system request.
A successful request won't leave anything useful there."

So $! is only sourced when a system error occurs and it is not cleared prior
to the call. If no error occurs, the value is indeterminate.

\=item Tie::Gzip-0.03

prerequisite program because loaded the  Data::Secs2 test modules
to tlib\Test instead of tlib\Data.

\=item Tie::Gzip-0.04

The lastest build of Test::STDmaker expects the test library in the same
directory as the test script.
Coordiated with the lastest Test::STDmaker by moving the
test library from tlib to t/Tie, the same directory as the test script
and deleting the test library File::TestPath program module.


http://ppm.activestate.com/BuildStatus/5.8-linux/linux-5.8/Tie-Gzip-0.03.txt

has the following failures:

 PERL_DL_NONLAZY=1 /home/cpanrun/tmp/5.8.0/bin/perl "-MExtUtils::Command::MM" "-e" "test_harness(0, 'blib/lib', 'blib/arch')" t/Tie/Gzip.t
 t/Tie/Gzip....Could not pipe | gzip --stdout > Gzip1.htm.gz: Illegal seek
 Could not pipe gzip --decompress --stdout Gzip1.htm.gz |: Illegal seek
 Could not pipe gzip --decompress --stdout Gzip1.htm.gz |: Illegal seek
 # Cannot open <Gzip1.htm
 # Test 9 got: '' (t/Tie/Gzip.t at line 319)
 #   Expected: '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
 <html>

 [snip]

 FAILED test 9
	Failed 1/11 tests, 90.91% okay (less 5 skipped tests: 5 okay, 45.45%)
 Failed 1/1 test scripts, 0.00% okay. 1/11 subtests failed, 90.91% okay.
 Failed Test  Stat Wstat Total Fail  Failed  List of Failed
 -------------------------------------------------------------------------------
 t/Tie/Gzip.t               11    1   9.09%  9
 5 subtests skipped.


The test script is not right and this is a false failure. 
The test script uses the <Test:Tech> 
features to force the C<ok> and C<skip> to perform a skip. 
However, this does not work for Perl code outside the C<ok> and C<skip>
subroutines.  Added test code to skip outside the C<ok> and C<skip> 
subroutines.

\=back

^

DOCUMENT_OVERVIEW:
This document releases ${NAME} version ${VERSION}
providing a description of the inventory, installation
instructions and other information necessary to
utilize and track this release.
^

CAPABILITIES: 
The 'Tie::Gzip' module provides a file handle Tie 
for compressing and uncompressing files using
the gzip format.

By tieing a filehandle to 'Tie::Gzip' subsequent uses
of the file subroutines with the tied filehandle will
compress data written to an opened file using gzip compression
and decompress data read from an opened file using gzip
compression.

If the 'Tie::Gzip' tie receives a I<filename> or I<mode filename>
after completing the tie, 'Tie::Gzip' will open I<filename>.

During the tie, Tie::Gzip will first try to load the
'Compress::Zlib' module and package. 
If successful, 'Tie::Gzip' uses the 'Compress::Zlib' for
compressing and decompressing the file data.

If unsuccessful, 'Tie::Gzip' setups up the following pipes
to an anticipated GNU 'gzip' site command for compressing and
decompressing the file data:

 gzip --decompress --stdout {} | # read file data
 | gzip --stdout > {} # write file data

where the string '{}' is a placeholder for the I<filename>.
^

LICENSE:
Software Diamonds permits the redistribution
and use in source and binary forms, with or
without modification, provided that the 
following conditions are met: 

\=over 4

\=item 1

Redistributions of source code, modified or unmodified
must retain the above copyright notice, this list of
conditions and the following disclaimer. 

\=item 2

Redistributions in binary form must 
reproduce the above copyright notice,
this list of conditions and the following 
disclaimer in the documentation and/or
other materials provided with the
distribution.

\=back

SOFTWARE DIAMONDS, http://www.SoftwareDiamonds.com,
PROVIDES THIS SOFTWARE 
'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES,
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
SHALL SOFTWARE DIAMONDS BE LIABLE FOR ANY DIRECT,
INDIRECT, INCIDENTAL, SPECIAL,EXEMPLARY, OR 
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE,DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING USE OF THIS SOFTWARE, EVEN IF
ADVISED OF NEGLIGENCE OR OTHERWISE) ARISING IN
ANY WAY OUT OF THE POSSIBILITY OF SUCH DAMAGE.
^


INSTALLATION:
To installed the release file, use the CPAN module
pr PPM module in the Perl release
or the INSTALL.PL script at the following web site:

 http://packages.SoftwareDiamonds.com

Follow the instructions for the the chosen installation software.

If all else fails, the file may be manually installed.
Enter one of the following repositories in a web browser:

${REPOSITORY}

Right click on '${DIST_FILE}' and download to a temporary
installation directory.
Enter the following where $make is 'nmake' for microsoft
windows; otherwise 'make'.

 gunzip ${BASE_DIST_FILE}.tar.${COMPRESS_SUFFIX}
 tar -xf ${BASE_DIST_FILE}.tar
 perl Makefile.PL
 $make test
 $make install

On Microsoft operating system, nmake, tar, and gunzip 
must be in the exeuction path. If tar and gunzip are
not install, download and install unxutils from

 http://packages.softwarediamonds.com
^

SUPPORT: 603 882-0846 E<lt>support@SoftwareDiamonds.comE<gt>^

NOTES:
The following are useful acronyms:

\=over 4

\=item .d

extension for a Perl demo script file

\=item .pm

extension for a Perl Library Module

\=item .t

extension for a Perl test script file

\=back
^

SEE_ALSO: 
\=over 4

\=item Docs::US_DOD::SVD

  http://www.softwarediamonds/packages/  Docs-US_DOD-STD2167A-X.XX.tar.gz
  http://www.perl.com/CPAN/authors/id/S/SO/SOFTDIA/  Docs-US_DOD-STD2167A-X.XX.tar.gz

\=back
^

HTML:
<hr>
<p><br>
<!-- BLK ID="NOTICE" -->
<!-- /BLK -->
<p><br>
<!-- BLK ID="OPT-IN" -->
<!-- /BLK -->
<p><br>
<!-- BLK ID="LOG_CGI" -->
<!-- /BLK -->
<p><br>
^
~-~


