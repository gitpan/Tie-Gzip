#!perl
#
#
use 5.001;
use strict;
use warnings;
use warnings::register;

use vars qw($VERSION $DATE);
$VERSION = '0.01';   # automatically generated file
$DATE = '2003/09/12';


##### Demonstration Script ####
#
# Name: Gzip.d
#
# UUT: Tie::Gzip
#
# The module Test::STDmaker generated this demo script from the contents of
#
# t::Tie::Gzip 
#
# Don't edit this test script file, edit instead
#
# t::Tie::Gzip
#
#	ANY CHANGES MADE HERE TO THIS SCRIPT FILE WILL BE LOST
#
#       the next time Test::STDmaker generates this script file.
#
#

######
#
# The working directory is the directory of the generated file
#
use vars qw($__restore_dir__ @__restore_inc__ );

BEGIN {
    use Cwd;
    use File::Spec;
    use File::TestPath;
    use Test::Tech qw(tech_config plan demo skip_tests);

    ########
    # Working directory is that of the script file
    #
    $__restore_dir__ = cwd();
    my ($vol, $dirs, undef) = File::Spec->splitpath(__FILE__);
    chdir $vol if $vol;
    chdir $dirs if $dirs;

    #######
    # Add the library of the unit under test (UUT) to @INC
    #
    @__restore_inc__ = File::TestPath->test_lib2inc();

    unshift @INC, File::Spec->catdir( cwd(), 'lib' ); 

}

END {

   #########
   # Restore working directory and @INC back to when enter script
   #
   @INC = @__restore_inc__;
   chdir $__restore_dir__;

}

print << 'MSG';

 ~~~~~~ Demonstration overview ~~~~~
 
Perl code begins with the prompt

 =>

The selected results from executing the Perl Code 
follow on the next lines. For example,

 => 2 + 2
 4

 ~~~~~~ The demonstration follows ~~~~~

MSG

demo( "\ \ \ \ use\ File\:\:Package\;\
\ \ \ \ use\ File\:\:Copy\;\
\ \ \ \ use\ File\:\:SmartNL\;\
\
\ \ \ \ my\ \$uut\ \=\ \'Tie\:\:Gzip\'\;\ \#\ Unit\ Under\ Test\
\ \ \ \ my\ \$fp\ \=\ \'File\:\:Package\'\;\
\ \ \ \ my\ \$snl\ \=\ \'File\:\:SmartNL\'\;\
\ \ \ \ my\ \$loaded\;"); # typed in command           
          use File::Package;
    use File::Copy;
    use File::SmartNL;

    my $uut = 'Tie::Gzip'; # Unit Under Test
    my $fp = 'File::Package';
    my $snl = 'File::SmartNL';
    my $loaded;; # execution

demo( "my\ \$errors\ \=\ \$fp\-\>load_package\(\$uut\)"); # typed in command           
      my $errors = $fp->load_package($uut); # execution

demo( "\$errors", # typed in command           
      $errors # execution
) unless     $loaded; # condition for execution                            

demo( "\ \ \ \ \ \ sub\ gz_decompress\
\ \ \ \ \ \{\
\ \ \ \ \ \ \ \ \ my\ \(\$gzip\)\ \=\ shift\ \@_\;\
\ \ \ \ \ \ \ \ \ my\ \$file\ \=\ \'Gzip1\.htm\'\;\
\ \
\ \ \ \ \ \ \ \ \ return\ undef\ unless\ open\(\$gzip\,\ \"\<\ \$file\.gz\"\)\;\
\
\ \ \ \ \ \ \ \ \ if\(\ open\ \(FILE\,\ \"\>\ \$file\"\ \)\ \)\ \{\
\ \ \ \ \ \ \ \ \ \ \ \ \ while\(\ my\ \$line\ \=\ \<\$gzip\>\ \)\ \{\
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ print\ FILE\ \$line\;\
\ \ \ \ \ \ \ \ \ \ \ \ \ \}\
\ \ \ \ \ \ \ \ \ \ \ \ \ close\ FILE\;\
\ \ \ \ \ \ \ \ \ \ \ \ \ close\ \$gzip\;\
\ \ \ \ \ \ \ \ \ \ \ \ \ unlink\ \'Gzip1\.htm\.gz\'\;\
\ \ \ \ \ \ \ \ \ \ \ \ \ return\ 1\;\
\ \ \ \ \ \ \ \ \ \}\
\
\ \ \ \ \ \ \ \ \ 1\ \
\
\ \ \ \ \ \}\
\
\ \ \ \ \ sub\ gz_compress\
\ \ \ \ \ \{\
\ \ \ \ \ \ \ \ \ my\ \(\$gzip\)\ \=\ shift\ \@_\;\
\ \ \ \ \ \ \ \ \ my\ \$file\ \=\ \'Gzip1\.htm\'\;\
\ \ \ \ \ \ \ \ \ return\ undef\ unless\ open\(\$gzip\,\ \"\>\ \$file\.gz\"\)\;\
\ \ \ \ \ \ \ \ \
\ \ \ \ \ \ \ \ \ if\(\ open\(FILE\,\ \"\<\ \$file\"\)\ \)\ \{\
\ \ \ \ \ \ \ \ \ \ \ \ \ while\(\ my\ \$line\ \=\ \<FILE\>\ \)\ \{\
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ print\ \$gzip\ \$line\;\
\ \ \ \ \ \ \ \ \ \ \ \ \ \}\
\ \ \ \ \ \ \ \ \ \ \ \ \ close\ FILE\;\
\ \ \ \ \ \ \ \ \ \ \ \ \ unlink\ \$file\;\
\ \ \ \ \ \ \ \ \ \}\
\ \ \ \ \ \ \ \ \ close\ \$gzip\;\
\ \ \ \ \}\
\
\ \ \ \ \#\#\#\#\#\
\ \ \ \ \#\ Compress\ Gzip1\.htm\ with\ gzip\ software\ unit\ of\ opportunity\
\ \ \ \ \#\ Decompress\ Gzip1\.htm\,gz\ with\ gzip\ software\ unit\ of\ opportunity\
\ \ \ \ \#\
\ \ \ \ unlink\ \'Gzip1\.htm\'\;\
\ \ \ \ copy\ \'Gzip0\.htm\'\,\ \'Gzip1\.htm\'\;\
\ \ \ \ tie\ \*GZIP\,\ \'Tie\:\:Gzip\'\;\
\ \ \ \ my\ \$tie_obj\ \=\ tied\ \*GZIP\;\
\ \ \ \ my\ \$gz_package\ \=\ \$tie_obj\-\>\{gz_package\}\;\
\ \ \ \ my\ \$gzip\ \=\ \\\*GZIP\;\
\ \ \ \ my\ \$success1\ \=\ 0\;\
\ \ \ \ skip_tests\(\ \)\ unless\ gz_compress\(\ \$gzip\ \)\;"); # typed in command           
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
    skip_tests( ) unless gz_compress( $gzip );; # execution

demo( "\-e\ \'Gzip1\.htm\.gz\'", # typed in command           
      -e 'Gzip1.htm.gz'); # execution


demo( "gz_decompress\(\ \$gzip\ \)"); # typed in command           
      gz_decompress( $gzip ); # execution

demo( "\$success1\ \=\ \$snl\-\>fin\(\ \'Gzip1\.htm\'\)\ eq\ \$snl\-\>fin\(\ \'Gzip0\.htm\'\)", # typed in command           
      $success1 = $snl->fin( 'Gzip1.htm') eq $snl->fin( 'Gzip0.htm')); # execution


demo( "\ \ \ \ \#\#\#\#\#\ \
\ \ \ \ \#\ Compress\ Gzip1\.htm\ with\ site\ GNU\ gzip\
\ \ \ \ \#\ Decompress\ Gzip1\.htm\,gz\ with\ site\ GNU\ gzip\
\ \ \ \ \#\
\ \ \ \ skip_tests\ 0\;\
\ \ \ \ tie\ \*GZIP\,\ \'Tie\:\:Gzip\'\,\ \{\
\ \ \ \ \ \ \ \ read_pipe\ \=\>\ \'gzip\ \-\-decompress\ \-\-stdout\ \{\}\'\,\
\ \ \ \ \ \ \ \ write_pipe\ \=\>\ \'gzip\ \-\-stdout\ \>\ \{\}\'\,\
\ \ \ \ \}\;\
\ \ \ \ \$gzip\ \=\ \\\*GZIP\;\
\ \ \ \ \
\ \ \ \ my\ \$success2\ \=\ 0\;\
\ \ \ \ skip_tests\(\ \)\ unless\ gz_compress\(\ \$gzip\ \)\;"); # typed in command           
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
    skip_tests( ) unless gz_compress( $gzip );; # execution

demo( "\-e\ \'Gzip1\.htm\.gz\'", # typed in command           
      -e 'Gzip1.htm.gz'); # execution


demo( "gz_decompress\(\ \$gzip\ \)"); # typed in command           
      gz_decompress( $gzip ); # execution

demo( "\$success2\ \=\ \$snl\-\>fin\(\ \'Gzip1\.htm\'\)\ eq\ \$snl\-\>fin\(\ \'Gzip0\.htm\'\)", # typed in command           
      $success2 = $snl->fin( 'Gzip1.htm') eq $snl->fin( 'Gzip0.htm')); # execution


demo( "unlink\ \'Gzip1\.htm\'"); # typed in command           
      unlink 'Gzip1.htm'; # execution


=head1 NAME

Gzip.d - demostration script for Tie::Gzip

=head1 SYNOPSIS

 Gzip.d

=head1 OPTIONS

None.

=head1 COPYRIGHT

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

## end of test script file ##

=cut

