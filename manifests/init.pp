# @summary This module installs run1 from copr
#
# @param baseurl Location of the run1 repo
# @param yumrepo_ensure `ensure` value for the yum repo
# @param yumrepo_description Yum repo `description` configuration option
# @param yumrepo_enabled Yum repo `enabled` configuration option
# @param yumrepo_skip_if_unavailable Yum repo `skip_if_unavailable` configuration option
# @param yumrepo_gpgcheck Yum repo `gpgcheck` configuration option
# @param yumrepo_repo_gpgcheck Yum repo `repo_gpgcheck` configuration option Yum repo `repo_gpgcheck` configuration option
# @param yumrepo_gpgkey GPG key to use for this repo Yum repo `gpgkey` configuration option
# @param yumrepo_target Target file for the yum repo configuration
# @param yumrepo_options Additional yum repo configuration options
# @param package_name The name of the `run1` package
# @param package_ensure Package [`ensure` attribute](https://puppet.com/docs/puppet/latest/types/package.html#package-attribute-ensure)
#
# @author Steven Pritchard <steven.pritchard@gmail.com>
class run1 (
  String[1]        $baseurl,
  # As of July 2022, the trailing comma check incorrectly
  # wants to add trailing commas to type definitions.
  # https://github.com/voxpupuli/puppet-lint-trailing_comma-check/issues/16
  # lint:ignore:trailing_comma
  Enum[
    'present',
    'absent'
  ]                $yumrepo_ensure,
  String           $yumrepo_description,
  Variant[
    String,
    Integer,
    Boolean
  ]                $yumrepo_enabled,
  Variant[
    String,
    Integer,
    Boolean
  ]                $yumrepo_skip_if_unavailable,
  Variant[
    String,
    Integer,
    Boolean
  ]                $yumrepo_gpgcheck,
  Variant[
    String,
    Integer,
    Boolean
  ]                $yumrepo_repo_gpgcheck,
  String           $yumrepo_gpgkey,
  Stdlib::Unixpath $yumrepo_target,
  Hash             $yumrepo_options,
  Variant[
    String[1],
    Array[String[1]]
  ]                $package_name,
  # lint:endignore
  String[1]        $package_ensure,
) {
  yumrepo { 'steve-run1':
    ensure              => $yumrepo_ensure,
    descr               => $yumrepo_description,
    enabled             => $yumrepo_enabled,
    skip_if_unavailable => $yumrepo_skip_if_unavailable,
    gpgcheck            => $yumrepo_gpgcheck,
    repo_gpgcheck       => $yumrepo_repo_gpgcheck,
    gpgkey              => $yumrepo_gpgkey,
    baseurl             => $baseurl,
    target              => $yumrepo_target,
    *                   => $yumrepo_options,
  } -> package { $package_name:
    ensure => $package_ensure,
  }
}
