#!/usr/bin/perl
use strict;
use warnings;

use Switch;
use File::Basename;
use Cwd qw(getcwd);

my $fname = basename(getcwd);

print("==^.^== Kosh backup script ==^.^==\n");

if ($fname ne "backup") {
    print("Run the script from backup directory only\n");
    exit;
}

my $ch;

while($ch ne "q") {
    print("Select action:\n");
    print("\tm: for move zip\n");
    print("\tu: for unzip\n");
    print("\td: for diff\n");
    print("\tb: for backup\n");
    print("\tc: for clean\n");
    print("\tq: for exit\n");

    $ch = <STDIN>;
    chomp $ch;
    print("> " . $ch . "\n");

    switch($ch) {
        case "q" {print("quitting...\n");}
        case "m" {system("gd_move");}
        case "u" {system("gd_unzip");}
        case "d" {system("gd_diff");}
        case "b" {system("gd_sync");}
        case "c" {system("gd_clean");}
        else     {print("Unknown option\b");}
    }
}
