# cc-template-pack
This Template Pack provides the required structure and some best practices for pack development

## How to use:
1. Create a new repo based on this template
2. Edit package.json
3. Review [LICENSE] information, and select a license to apply to your content.
4. Move this README.md out of the way, and put README-newpack.md in its place.
5. Put in your stuff
6. Optional: tag a Release so that the workflow actions take place and create your .crbl file
7. Configure the automatic testing and release management (optional)

## Documentation
Documentation is stored in the template content itself when possible.  Additional information
is also stored in the [github wiki pages](https://github.com/jpvlsmv/cc-template-pack/wiki) for the project.

### Note on licensing:
The cc-template-pack is released under the Apache2 license, as per the LICENSE file in the 
repository.  The point of the template pack is to facilitate creation of other packs, which
might contain non-template content under a different license.  To the extent that another
pack is a derivative work of the cc-template-pack, the terms of the cc-template-pack
license must be met for the cc-template-pack content.

#### Note on licensing note:
I (Joe Moore) am not a lawyer.  The "Note on licensing" section above is not legal advice and is
my (Joe Moore's) understanding of complicated legal issues.  In case of disagreement between
this document and the LICENSE, the terms of the LICENSE apply.

## Structure:
* README-newpack.md
* package.json
* LICENSE
* data
  * lookups
    * {lookup_name.json}
    * {lookupname.yml}
  * samples
    * {sample_name.json}
* default
  * pack.yml
  * parsers.yml
  * regexes.yml
  * vars.yml
  * samples.yml
  * schemas.yml
  * grok-patters
    * {grok_name}
  * pipelines
    * route.yml
    * {pipeline_name.json}
      * conf.yml
  * schemas
    * {schema_name.json}
  * functions
    * {function_name}

## Getting help
Help and support for the cc-template-pack is available on a best-effort basis
at [https://github.com/jpvlsmv/cc-template-pack/issues]
and [https://github.com/jpvlsmv/cc-template-pack/wiki].  

Help and support for a pack based on cc-template-pack is the responsibility of that pack's developer.

## License
This Pack uses the following license: [`Apache 2.0`](https://github.com/jpvlsmv/cc-template-pack/blob/main/LICENSE).

## References
https://cribl-community.slack.com/files/U01C35EMQ01/F0371V25AQY/wednesday_windows_pack_training.pptx

https://docs.cribl.io/stream/packs-standards/
