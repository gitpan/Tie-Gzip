#!perl
#
# The copyright notice and plain old documentation (POD)
# are at the end of this file.
#
package  t::Tie::Gzip;

use strict;
use warnings;
use warnings::register;

use vars qw($VERSION $DATE $FILE );
$VERSION = '0.01';
$DATE = '2003/09/12';
$FILE = __FILE__;

########
# The Test::STDmaker module uses the data after the __DATA__ 
# token to automatically generate the this file.
#
# Don't edit anything before __DATA_. Edit instead
# the data after the __DATA__ token.
#
# ANY CHANGES MADE BEFORE the  __DATA__ token WILL BE LOST
#
# the next time Test::STDmaker generates this file.
#
#


=head1 TITLE PAGE

 Detailed Software Test Description (STD)

 for

 Perl Tie::Gzip Program Module

 Revision: -

 Version: 

 Date: 2003/09/12

 Prepared for: General Public 

 Prepared by:  http://www.SoftwareDiamonds.com support@SoftwareDiamonds.com

 Classification: None

=head1 SCOPE

This detail STD and the 
L<General Perl Program Module (PM) STD|Test::STD::PerlSTD>
establishes the tests to verify the
requirements of Perl Program Module (PM) L<Tie::Gzip|Tie::Gzip>

The format of this STD is a tailored L<2167A STD DID|Docs::US_DOD::STD>.
in accordance with 
L<Detail STD Format|Test::STDmaker/Detail STD Format>.

#######
#  
#  4. TEST DESCRIPTIONS
#
#  4.1 Test 001
#
#  ..
#
#  4.x Test x
#
#

=head1 TEST DESCRIPTIONS

The test descriptions uses a legend to
identify different aspects of a test description
in accordance with
L<STD FormDB Test Description Fields|Test::STDmaker/STD FormDB Test Description Fields>.

=head2 Test Plan

 T: 11^

=head2 ok: 1


  C:
     use File::Package;
     use File::Copy;
     use File::SmartNL;
     my $uut = 'Tie::Gzip'; # Unit Under Test
     my $fp = 'File::Package';
     my $snl = 'File::SmartNL';
     my $loaded;
 ^
 VO: ^
  N: UUT not loaded^
  A: $loaded = $fp->is_package_loaded($uut)^
  E:  ''^
 ok: 1^

=head2 ok: 2

  N: Load UUT^
  S: $loaded^
  C: my $errors = $fp->load_package($uut)^
  A: $errors^
 SE: ''^
 ok: 2^

=head2 ok: 3


  C:
       sub gz_decompress
      {
          my ($gzip) = shift @_;
          my $file = 'Gzip1.htm';
  
          return undef unless open($gzip, "< $file.gz");
          if( open (FILE, "> $file" ) ) {
              while( my $line = <$gzip> ) {
                   print FILE $line;
              }
              close FILE;
              close $gzip;
              unlink 'Gzip1.htm.gz';
              return 1;
          }
          1 
      }
      sub gz_compress
      {
          my ($gzip) = shift @_;
          my $file = 'Gzip1.htm';
          return undef unless open($gzip, "> $file.gz");
         
          if( open(FILE, "< $file") ) {
              while( my $line = <FILE> ) {
                     print $gzip $line;
              }
              close FILE;
              unlink $file;
          }
          close $gzip;
     }
     #####
     # Compress Gzip1.htm with gzip software unit of opportunity
     # Decompress Gzip1.htm,gz with gzip software unit of opportunity
     #
     unlink 'Gzip1.htm';
     copy 'Gzip0.htm', 'Gzip1.htm';
     tie *GZIP, 'Tie::Gzip';
     my $tie_obj = tied *GZIP;
     my $gz_package = $tie_obj->{gz_package};
     my $gzip = \*GZIP;
     my $success1 = 0;
     skip_tests( ) unless gz_compress( $gzip );
 ^
  N: Compress Gzip1.htm with gzip software unit of opportunity^
  A: -e 'Gzip1.htm.gz'^
  E: 1^
 ok: 3^

=head2 ok: 4

  C: gz_decompress( $gzip )^
  R: L<Tie::Gzip/data integrity [1]>^
  N: Restore Gzip1.htm with gzip software unit of opportunity^
  A: $success1 = $snl->fin( 'Gzip1.htm') eq $snl->fin( 'Gzip0.htm')^
  E: 1^
 ok: 4^

=head2 ok: 5


  C:
     ##### 
     # Compress Gzip1.htm with site GNU gzip
     # Decompress Gzip1.htm,gz with site GNU gzip
     #
     skip_tests 0;
     tie *GZIP, 'Tie::Gzip', {
         read_pipe => 'gzip --decompress --stdout {}',
         write_pipe => 'gzip --stdout > {}',
     };
     $gzip = \*GZIP;
     
     my $success2 = 0;
     skip_tests( ) unless gz_compress( $gzip );
 ^
  N: Compress Gzip1.htm with site GNU gzip^
  A: -e 'Gzip1.htm.gz'^
  E: 1^
 ok: 5^

=head2 ok: 6

  C: gz_decompress( $gzip )^
  R: L<Tie::Gzip/data integrity [1]>^
  N: Restore Gzip1.htm with site GNU gzip^
  A: $success2 = $snl->fin( 'Gzip1.htm') eq $snl->fin( 'Gzip0.htm')^
  E: 1^
 ok: 6^

=head2 ok: 7

 VO: ^
  N: At least one gzip software unit works^
  A: $success1 || $success2^
  E: 1^
 ok: 7^

=head2 ok: 8

 VO: ^

  C:
     ######
     # Compress Gzip1.htm with Compress::Zlib
     # Decompress Gzip1.htm,gz with site GNU gzip
     #
     skip_tests !($gz_package && $success2);
     tie *GZIP, 'Tie::Gzip', {
         read_pipe => 'gzip --decompress --stdout {}',
     };
     $gzip = \*GZIP;
     skip_tests( ) unless gz_compress( $gzip );
 ^
  N: Compress Gzip1.htm with Compress::Zlib^
  A: -e 'Gzip1.htm.gz'^
  E: 1^
 ok: 8^

=head2 ok: 9

 VO: ^
  C: gz_decompress( $gzip )^
  R: L<Tie::Gzip/interoperability [1]>^
  N: Restore Gzip1.htm with site GNU gzip^
  A: $snl->fin( 'Gzip1.htm')^
  E: $snl->fin( 'Gzip0.htm')^
 ok: 9^

=head2 ok: 10

 VO: ^

  C:
     ######
     # Compress Gzip1.htm with site GNU gzipC
     # Decompress Gzip1.htm,gz with ompress::Zlib
     #
     skip_tests !($gz_package && $success2);
     tie *GZIP, 'Tie::Gzip', {
         write_pipe => 'gzip --stdout > {}',
     };
     $gzip = \*GZIP;
     skip_tests( ) unless gz_compress( $gzip );
 ^
 VO: ^
  N: Compress Gzip1.htm with site GNU gzip^
  A: -e 'Gzip1.htm.gz'^
  E: 1^
 ok: 10^

=head2 ok: 11

 VO: ^
  C: gz_decompress( $gzip )^
  R: L<Tie::Gzip/interoperability [1]>^
  N: Restore Gzip1.htm with Compress::Zlib^
  A: $snl->fin( 'Gzip1.htm')^
  E: $snl->fin( 'Gzip0.htm')^
 ok: 11^



#######
#  
#  5. REQUIREMENTS TRACEABILITY
#
#

=head1 REQUIREMENTS TRACEABILITY

  Requirement                                                      Test
 ---------------------------------------------------------------- ----------------------------------------------------------------
 L<Tie::Gzip/data integrity [1]>                                  L<t::Tie::Gzip/ok: 4>
 L<Tie::Gzip/data integrity [1]>                                  L<t::Tie::Gzip/ok: 6>
 L<Tie::Gzip/interoperability [1]>                                L<t::Tie::Gzip/ok: 11>
 L<Tie::Gzip/interoperability [1]>                                L<t::Tie::Gzip/ok: 9>


  Test                                                             Requirement
 ---------------------------------------------------------------- ----------------------------------------------------------------
 L<t::Tie::Gzip/ok: 11>                                           L<Tie::Gzip/interoperability [1]>
 L<t::Tie::Gzip/ok: 4>                                            L<Tie::Gzip/data integrity [1]>
 L<t::Tie::Gzip/ok: 6>                                            L<Tie::Gzip/data integrity [1]>
 L<t::Tie::Gzip/ok: 9>                                            L<Tie::Gzip/interoperability [1]>


=cut

#######
#  
#  6. NOTES
#
#

=head1 NOTES

copyright © 2003 Software Diamonds.

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

#######
#
#  2. REFERENCED DOCUMENTS
#
#
#

=head1 SEE ALSO

L<Compress::Gzip>

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
<!-- BLK ID="EMAIL" -->
<!-- /BLK -->
<p><br>
<!-- BLK ID="LOG_CGI" -->
<!-- /BLK -->
<p><br>

=cut

__DATA__

File_Spec: Unix^
UUT: Tie::Gzip^
Revision: -^
End_User: General Public^
Author: http://www.SoftwareDiamonds.com support@SoftwareDiamonds.com^
Detail_Template: ^
STD2167_Template: ^
Version: ^
Classification: None^
Temp: temp.pl^
Demo: Gzip.d^
Verify: Gzip.t^


 T: 11^


 C:
    use File::Package;
    use File::Copy;
    use File::SmartNL;

    my $uut = 'Tie::Gzip'; # Unit Under Test
    my $fp = 'File::Package';
    my $snl = 'File::SmartNL';
    my $loaded;
^

VO: ^
 N: UUT not loaded^
 A: $loaded = $fp->is_package_loaded($uut)^
 E:  ''^
ok: 1^

 N: Load UUT^
 S: $loaded^
 C: my $errors = $fp->load_package($uut)^
 A: $errors^
SE: ''^
ok: 2^


 C:
      sub gz_decompress
     {
         my ($gzip) = shift @_;
         my $file = 'Gzip1.htm';
 
         return undef unless open($gzip, "< $file.gz");

         if( open (FILE, "> $file" ) ) {
             while( my $line = <$gzip> ) {
                  print FILE $line;
             }
             close FILE;
             close $gzip;
             unlink 'Gzip1.htm.gz';
             return 1;
         }

         1 

     }

     sub gz_compress
     {
         my ($gzip) = shift @_;
         my $file = 'Gzip1.htm';
         return undef unless open($gzip, "> $file.gz");
        
         if( open(FILE, "< $file") ) {
             while( my $line = <FILE> ) {
                    print $gzip $line;
             }
             close FILE;
             unlink $file;
         }
         close $gzip;
    }

    #####
    # Compress Gzip1.htm with gzip software unit of opportunity
    # Decompress Gzip1.htm,gz with gzip software unit of opportunity
    #
    unlink 'Gzip1.htm';
    copy 'Gzip0.htm', 'Gzip1.htm';
    tie *GZIP, 'Tie::Gzip';
    my $tie_obj = tied *GZIP;
    my $gz_package = $tie_obj->{gz_package};
    my $gzip = \*GZIP;
    my $success1 = 0;
    skip_tests( ) unless gz_compress( $gzip );
^

 N: Compress Gzip1.htm with gzip software unit of opportunity^
 A: -e 'Gzip1.htm.gz'^
 E: 1^
ok: 3^

 C: gz_decompress( $gzip )^
 R: L<Tie::Gzip/data integrity [1]>^
 N: Restore Gzip1.htm with gzip software unit of opportunity^
 A: $success1 = $snl->fin( 'Gzip1.htm') eq $snl->fin( 'Gzip0.htm')^
 E: 1^
ok: 4^


 C:
    ##### 
    # Compress Gzip1.htm with site GNU gzip
    # Decompress Gzip1.htm,gz with site GNU gzip
    #
    skip_tests 0;
    tie *GZIP, 'Tie::Gzip', {
        read_pipe => 'gzip --decompress --stdout {}',
        write_pipe => 'gzip --stdout > {}',
    };
    $gzip = \*GZIP;
    
    my $success2 = 0;
    skip_tests( ) unless gz_compress( $gzip );
^

 N: Compress Gzip1.htm with site GNU gzip^
 A: -e 'Gzip1.htm.gz'^
 E: 1^
ok: 5^

 C: gz_decompress( $gzip )^
 R: L<Tie::Gzip/data integrity [1]>^
 N: Restore Gzip1.htm with site GNU gzip^
 A: $success2 = $snl->fin( 'Gzip1.htm') eq $snl->fin( 'Gzip0.htm')^
 E: 1^
ok: 6^

VO: ^
 N: At least one gzip software unit works^
 A: $success1 || $success2^
 E: 1^
ok: 7^

VO: ^

 C:
    ######
    # Compress Gzip1.htm with Compress::Zlib
    # Decompress Gzip1.htm,gz with site GNU gzip
    #
    skip_tests !($gz_package && $success2);
    tie *GZIP, 'Tie::Gzip', {
        read_pipe => 'gzip --decompress --stdout {}',
    };
    $gzip = \*GZIP;
    skip_tests( ) unless gz_compress( $gzip );
^

 N: Compress Gzip1.htm with Compress::Zlib^
 A: -e 'Gzip1.htm.gz'^
 E: 1^
ok: 8^

VO: ^
 C: gz_decompress( $gzip )^
 R: L<Tie::Gzip/interoperability [1]>^
 N: Restore Gzip1.htm with site GNU gzip^
 A: $snl->fin( 'Gzip1.htm')^
 E: $snl->fin( 'Gzip0.htm')^
ok: 9^

VO: ^

 C:
    ######
    # Compress Gzip1.htm with site GNU gzipC
    # Decompress Gzip1.htm,gz with ompress::Zlib
    #
    skip_tests !($gz_package && $success2);
    tie *GZIP, 'Tie::Gzip', {
        write_pipe => 'gzip --stdout > {}',
    };
    $gzip = \*GZIP;
    skip_tests( ) unless gz_compress( $gzip );
^

VO: ^
 N: Compress Gzip1.htm with site GNU gzip^
 A: -e 'Gzip1.htm.gz'^
 E: 1^
ok: 10^

VO: ^
 C: gz_decompress( $gzip )^
 R: L<Tie::Gzip/interoperability [1]>^
 N: Restore Gzip1.htm with Compress::Zlib^
 A: $snl->fin( 'Gzip1.htm')^
 E: $snl->fin( 'Gzip0.htm')^
ok: 11^

 C: unlink 'Gzip1.htm'^

See_Also: L<Compress::Gzip>^

Copyright:
copyright © 2003 Software Diamonds.

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


HTML:
<hr>
<p><br>
<!-- BLK ID="NOTICE" -->
<!-- /BLK -->
<p><br>
<!-- BLK ID="OPT-IN" -->
<!-- /BLK -->
<p><br>
<!-- BLK ID="EMAIL" -->
<!-- /BLK -->
<p><br>
<!-- BLK ID="LOG_CGI" -->
<!-- /BLK -->
<p><br>
^



~-~
