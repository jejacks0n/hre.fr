Hre.fr
======

Really trying hard for the name URL Shortener Service.

## Details

Super simple implementation of the features requested using Rails + RSpec, and sqlite3. I intentionally chose some of
the approaches because they have interesting implications that are fun for conversation. =) Thanks for your time
reviewing it.

Some business logic is extracted into jobs and we can consider these more or less Service Objects. This extraction
enables the code to be shared and used in various places in the project over time.

Testing is pretty light and not how I would normally do it. Generally my approach is to not have controller tests and
instead invest into more integration type specs like (capybara or similar) style that cover the whole stack -- which
these controller tests shoot for.

I always like to talk about delivering quick simple features, measuring success, and then iterating on improving the
features. I've pretty much taken that approach here as well and left a lot of room for new features and growth.

## Setup

Using docker we can get the project setup pretty easily.

Clone the repo, and cd into the new project path.

```shell
docker-compose build
docker-compose up
```

To run the test suite:

```shell
docker-compose run app rails spec
```

## Thoughts

### Phase 1 & 2

The approach taken here is more about finding existing urls and using those existing records, and then just having some
fanciness around the ids presented to the user. This gives us effectively same behavior, but keeps it more consistent
with what people might be expecting to see within Rails.

I dropped in a library for the id presentation behavior after researching it pretty thoroughly. They've already handled
things like inadvertent bad words (in english) and things like that. There's some interesting conversations about how to
write this sort of thing and where it should live once written. It's what Sandi Metz calls an "Omega Mess", and is code
that once written, is kind of a non-concern and shouldn't take up mental space. It's typically the end of a chain of
calls, and it's nice to move it out into a concern, and ultimately into an extracted piece of logic that can be shared.

[Some reading](http://mattbriggs.net/blog/2013/04/19/sometimes-its-ok-to-leave-a-mess/) on those thoughts since it's fun
to talk about.

### Phase 3 (simple)

Ok, so the feature here is super vague, and I sort of flub it by just throwing a new (non-required) attribute on Link.
That doesn't feel right for what this feature request introduces though, so let's at least talk about that for a minute.

If we were to add a migration for Link to belong to users fully (with a user record and model) it represents a pretty
large change to the system. I intentionally excluded the concept in phase 1 and 2 (even though I knew it was a
requirement), because it introduces some interesting questions and concerns when you consider a live system with a bunch
of links. Can we ever make a user required? And if so, should existing links without user ownership go away, or do we
forever run with the fact that we've got legacy data issues?

These are questions for teams, including product. I did the bare minimum since the CTO here at Hre.fr (me) claims we're
still in lean startup mode and can do things like that without complex migrations in our production system.   

### Phase 4

I spent the most time here, and would have some questions on the feature request of the route. Here just a simple REST
pattern was implemented (because I assume that's the desire), but I don't always agree with trying to strictly follow
those prescribed rules in some scenarios (this being one of those cases).
