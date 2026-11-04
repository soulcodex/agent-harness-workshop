# Review a change

Review from a fresh context. Inspect the actual diff, relevant project instructions, and reported
verification evidence.

Classify each finding as verified or uncertain. A useful finding identifies the affected boundary,
the concrete consequence, and the smallest correction. Do not manufacture findings to make a review
look thorough.

Check that deterministic evidence supports only the claim it can prove. Passing formatting or type
checks do not prove a business invariant without a focused test.

Check command output for warnings. Confirm each warning is either resolved in the change or has a
visible, pragmatic follow-up proposal. Do not accept a blanket warning suppression as a fix.
