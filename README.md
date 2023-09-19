# https://homework.adhoc.team/slcsp/ Calculate the second lowest cost silver plan

## Getting Started

To run the code with Ruby installed:

```console
- bundle install
- rspec
```

To create the output file

```console
- ruby -r "./lib/processor.rb" -e "Processor.write_slcsp_rates_file"
```

# Notes

## Implementation

I chose to ouput a new file rather than alter the existing one even though the instructions said to amend the existing one, because that's a bit destructive.
I used three classes, the data builder laregely so that it was easier to test with different values the business logic in the calulcation.

I was a little thrown by this line in the instructions

```
A ZIP code can potentially be in more than one county. If the county can not be determined definitively by the ZIP code, it may still be possible to determine the rate area for that ZIP code. 
```

It is the first time counties are mentioned and I wasn't sure why it was pointing me to 'determine the county' when the plans seemed to only know about rate areas and states. Either I missed something here or the wording might be tidied up slightly.


## Did I solve the problem

I believe so. I think I captured the business logic rules

- Excluding zipcodes that appear in multiple rate areas
- Expecting that multiple rates can exist for the same rate-area/state
- Only selecting Silver plans
- Choosing the second cheapest
- Ensuring to not count duplicate rates when deciding on the second one.

Everything seems to work but I cannot completely verify in the time constraints that the output results are what are expected. It would have been nice to have been given a test case with a known good result to work against, but maybe that would have made things to easy. 

In the end, an enjoyable puzzle.
