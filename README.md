Hre.fr
======

Really trying hard for the name URL Shortener Service (URLSS).

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
