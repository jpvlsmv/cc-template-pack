# cc-template-pack
This Template Pack provides the required structure and some best practices for pack development

## How to use:
1. Create a new repo based on this template
2. Edit package.json
3. Review LICENSE
4. Move this README.md out of the way, and put README-newpack.md in its place.
5. Create the pack 
6. Configure the automatic testing and release management (optional)

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

## References
https://cribl-community.slack.com/files/U01C35EMQ01/F0371V25AQY/wednesday_windows_pack_training.pptx

https://docs.cribl.io/stream/packs-standards/
