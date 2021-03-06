# @summary This module installs run1 from copr
#
# @param baseurl Location of the run1 repo
#
# @author Steven Pritchard <steven.pritchard@gmail.com>
class run1 (
  String[1] $baseurl,
) {
  yumrepo { 'steve-run1':
    ensure              => present,
    descr               => 'Copr repo for run1 owned by steve',
    enabled             => true,
    skip_if_unavailable => true,
    gpgcheck            => '1',
    repo_gpgcheck       => '0',
    gpgkey              => 'https://copr-be.cloud.fedoraproject.org/results/steve/run1/pubkey.gpg',
    baseurl             => $baseurl,
    target              => '/etc/yum.repos.d/steve-run1.repo',
  } -> package { 'run1':
    ensure => installed,
  }
}
