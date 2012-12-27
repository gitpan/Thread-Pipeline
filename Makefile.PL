
use strict;
use warnings;

BEGIN { require 5.010; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'multithreaded pipeline manager',
  'AUTHOR' => 'liosha <liosha@cpan.org>',
  'BUILD_REQUIRES' => {
    'Test::More' => '0',
    'YAML' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Thread-Pipeline',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Thread::Pipeline',
  'PREREQ_PM' => {
    'Carp' => '0',
    'Thread::Queue::Any' => '0',
    'strict' => '0',
    'threads' => '0',
    'threads::shared' => '0',
    'utf8' => '0',
    'warnings' => '0'
  },
  'VERSION' => '0.003',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



