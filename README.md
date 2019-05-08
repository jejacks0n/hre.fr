Hre.fr
======

Really trying hard for the name URL Shortener Service (URLSS).

### Musings

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
