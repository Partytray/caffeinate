# Changelog

Important additions/changes/removals will appear here.

## v2.0.1 (September 11, 2021)

### Fixed
* Unsubscribe/resubscribe links on views of the `CampaignSubscriptionsController`

## v2.0.0 (September 11, 2021)

### Changed
* `CampaignSubscription` now creates the relevant mailings using `after_create` instead of `after_commit` 
    - The original logic was flawed: the `on_complete` callback for a `Dripper` would be invoked due to how a
      `CampaignSubscription` is considered complete: `mailings.unsent.count.zero?`. `after_create` creates the mailings 
      in the same transaction as the `CampaignSubscription`, not outside of it.
      
### Removed
* Duplicate `#resubscribe!` method on `CampaignSubscription`

## v0.16 (April 14, 2021)

### Changed
* Change `delegate_missing_to` to normal `respond_to_missing?` and `method_missing`

## v0.15 (January 18, 2021)

### Added
* `Caffeinate::Mailing#send_at` column must is `not null`
* `Caffeinate::Mailing.unsent` reflects `Caffeinate::Mailing` records where `Caffeinate::CampaignSubscription` is active
* `Caffeinate::Campaign` now has an `active` scope 

### Changed
* Improved documentation.

### Removed
* Auto-subscribe functionality
    - This wasn't used (and this gem isn't even released); it was from the original implementation and carried over because
      I thought it was a good idea. It wasn't.

## v0.14 (January 18, 2021)

### Added
* This changelog
* Add Rails migration version when installing Caffeinate
* Ability to bail on a mailing in a `before_drip` callback ([3643dd](https://github.com/joshmn/caffeinate/commit/3643ddb6bd6d7456767ab9ec74f6e3a3d6c7ec5d#diff-c799b6345442d9f2975dee1b944b945d491174e7f39f3440d2c48b5ba4d31825))

### Changed
* Drip doesn't get evaluated if `before_drip` returns false 
