#!perl
#
#
use 5.001;
use strict;
use warnings;
use warnings::register;

use vars qw($VERSION $DATE $FILE);
$VERSION = '0.01';   # automatically generated file
$DATE = '2003/09/12';
$FILE = __FILE__;

use Getopt::Long;
use Cwd;
use File::Spec;

##### Test Script ####
#
# Name: Gzip.t
#
# UUT: Tie::Gzip
#
# The module Test::STDmaker generated this test script from the contents of
#
# t::Tie::Gzip;
#
# Don't edit this test script file, edit instead
#
# t::Tie::Gzip;
#
#	ANY CHANGES MADE HERE TO THIS SCRIPT FILE WILL BE LOST
#
#       the next time Test::STDmaker generates this script file.
#
#

######
#
# T:
#
# use a BEGIN block so we print our plan before Module Under Test is loaded
#
BEGIN { 
   use vars qw( $__restore_dir__ @__restore_inc__);

   ########
   # Working directory is that of the script file
   #
   $__restore_dir__ = cwd();
   my ($vol, $dirs) = File::Spec->splitpath(__FILE__);
   chdir $vol if $vol;
   chdir $dirs if $dirs;
   ($vol, $dirs) = File::Spec->splitpath(cwd(), 'nofile'); # absolutify

   #######
   # Add the library of the unit under test (UUT) to @INC
   # It will be found first because it is first in the include path
   #
   use Cwd;
   @__restore_inc__ = @INC;

   ######
   # Find root path of the t directory
   #
   my @updirs = File::Spec->splitdir( $dirs );
   while(@updirs && $updirs[-1] ne 't' ) { 
       chdir File::Spec->updir();
       pop @updirs;
   };
   chdir File::Spec->updir();
   my $lib_dir = cwd();

   #####
   # Add this to the include path. Thus modules that start with t::
   # will be found.
   # 
   $lib_dir =~ s|/|\\|g if $^O eq 'MSWin32';  # microsoft abberation
   unshift @INC, $lib_dir;  # include the current test directory

   #####
   # Add lib to the include path so that modules under lib at the
   # same level as t, will be found
   #
   $lib_dir = File::Spec->catdir( cwd(), 'lib' );
   $lib_dir =~ s|/|\\|g if $^O eq 'MSWin32';  # microsoft abberation
   unshift @INC, $lib_dir;

   #####
   # Add tlib to the include path so that modules under tlib at the
   # same level as t, will be found
   #
   $lib_dir = File::Spec->catdir( cwd(), 'tlib' );
   $lib_dir =~ s|/|\\|g if $^O eq 'MSWin32';  # microsoft abberation
   unshift @INC, $lib_dir;
   chdir $dirs if $dirs;
 
   #####
   # Add lib under the directory where the test script resides.
   # This may be used to place version sensitive modules.
   #
   $lib_dir = File::Spec->catdir( cwd(), 'lib' );
   $lib_dir =~ s|/|\\|g if $^O eq 'MSWin32';  # microsoft abberation
   unshift @INC, $lib_dir;

   ##########
   # Pick up a output redirection file and tests to skip
   # from the command line.
   #
   my $test_log = '';
   GetOptions('log=s' => \$test_log);

   ########
   # Using Test::Tech, a very light layer over the module "Test" to
   # conduct the tests.  The big feature of the "Test::Tech: module
   # is that it takes a expected and actual reference and stringify
   # them by using "Data::Dumper" before passing them to the "ok"
   # in test.
   #
   # Create the test plan by supplying the number of tests
   # and the todo tests
   #
   require Test::Tech;
   Test::Tech->import( qw(plan ok skip skip_tests tech_config) );
   plan(tests => 11);

}



END {

   #########
   # Restore working directory and @INC back to when enter script
   #
   @INC = @__restore_inc__;
   chdir $__restore_dir__;
}

   # Perl code from C:
    use File::Package;
    use File::Copy;
    use File::SmartNL;

    my $uut = 'Tie::Gzip'; # Unit Under Test
    my $fp = 'File::Package';
    my $snl = 'File::SmartNL';
    my $loaded;

ok(  $loaded = $fp->is_package_loaded($uut), # actual results
      '', # expected results
     "",
     "UUT not loaded");

#  ok:  1

   # Perl code from C:
my $errors = $fp->load_package($uut);

skip_tests( 1 ) unless skip(
      $loaded, # condition to skip test   
      $errors, # actual results
      '',  # expected results
      "",
      "Load UUT");
 
#  ok:  2

   # Perl code from C:
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

ok(  -e 'Gzip1.htm.gz', # actual results
     1, # expected results
     "",
     "Compress Gzip1.htm with gzip software unit of opportunity");

#  ok:  3

   # Perl code from C:
gz_decompress( $gzip );


####
# verifies requirement(s):
# L<Tie::Gzip/data integrity [1]>
# 

#####
ok(  $success1 = $snl->fin( 'Gzip1.htm') eq $snl->fin( 'Gzip0.htm'), # actual results
     1, # expected results
     "",
     "Restore Gzip1.htm with gzip software unit of opportunity");

#  ok:  4

   # Perl code from C:
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

ok(  -e 'Gzip1.htm.gz', # actual results
     1, # expected results
     "",
     "Compress Gzip1.htm with site GNU gzip");

#  ok:  5

   # Perl code from C:
gz_decompress( $gzip );


####
# verifies requirement(s):
# L<Tie::Gzip/data integrity [1]>
# 

#####
ok(  $success2 = $snl->fin( 'Gzip1.htm') eq $snl->fin( 'Gzip0.htm'), # actual results
     1, # expected results
     "",
     "Restore Gzip1.htm with site GNU gzip");

#  ok:  6

ok(  $success1 || $success2, # actual results
     1, # expected results
     "",
     "At least one gzip software unit works");

#  ok:  7

   # Perl code from C:
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

ok(  -e 'Gzip1.htm.gz', # actual results
     1, # expected results
     "",
     "Compress Gzip1.htm with Compress::Zlib");

#  ok:  8

   # Perl code from C:
gz_decompress( $gzip );


####
# verifies requirement(s):
# L<Tie::Gzip/interoperability [1]>
# 

#####
ok(  $snl->fin( 'Gzip1.htm'), # actual results
     $snl->fin( 'Gzip0.htm'), # expected results
     "",
     "Restore Gzip1.htm with site GNU gzip");

#  ok:  9

   # Perl code from C:
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

ok(  -e 'Gzip1.htm.gz', # actual results
     1, # expected results
     "",
     "Compress Gzip1.htm with site GNU gzip");

#  ok:  10

   # Perl code from C:
gz_decompress( $gzip );


####
# verifies requirement(s):
# L<Tie::Gzip/interoperability [1]>
# 

#####
ok(  $snl->fin( 'Gzip1.htm'), # actual results
     $snl->fin( 'Gzip0.htm'), # expected results
     "",
     "Restore Gzip1.htm with Compress::Zlib");

#  ok:  11

   # Perl code from C:
unlink 'Gzip1.htm';


=head1 NAME

Gzip.t - test script for Tie::Gzip

=head1 SYNOPSIS

 Gzip.t -log=I<string>

=head1 OPTIONS

All options may be abbreviated with enough leading characters
to distinguish it from the other options.

=over 4

=item C<-log>

Gzip.t uses this option to redirect the test results 
from the standard output to a log file.

=back

=head1 COPYRIGHT

copyright � 2003 Software Diamonds.

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

=cut

## end of test script file ##

