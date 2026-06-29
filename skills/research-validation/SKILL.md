---
name: research-validation
description: "Validate research, ML, data, performance, benchmark, model, and evaluation claims with a hypothesis, baseline, metric, measurement method, and limitations."
---

# Research Validation

Use this skill to prevent weak evidence from becoming a confident claim.

## Core Rule

Do not claim an approach is better until it has been compared against a relevant baseline with a defined metric.

If the evidence is weak, noisy, biased, too small, or operationally impractical, say so directly.

## Workflow

### 1. State the Question

Write the decision being tested in one sentence.

Good questions are concrete:

- Does this source add useful signal beyond existing data?
- Does this model beat the current baseline on the target metric?
- Does this optimization reduce latency under the relevant workload?
- Is this implementation direction worth continuing?

### 2. Define the Hypothesis

State what should improve and why.

Include:

- expected mechanism
- affected population or workload
- expected failure mode if the idea is wrong

### 3. Choose the Baseline

Compare against the simplest relevant alternative:

- current production behavior
- existing model or heuristic
- random, majority, recency, or popularity baseline
- previous benchmark result
- no-new-source or no-change version

Do not compare only against a weak straw baseline.

### 4. Define Success

Pick the metric before looking for a win.

Use metrics that match the goal:

- predictive work: out-of-sample performance, calibration, ranking quality, leakage checks
- performance work: latency, throughput, memory, cost, tail behavior
- data/source work: coverage, freshness, stability, backfill depth, join rate, collection risk
- product/UX work: task completion, error rate, time, user-visible correctness

Also define practical significance. A tiny metric lift may not justify operational complexity.

### 5. Measure Carefully

- Separate train/test, before/after, or control/treatment clearly.
- Check leakage, selection bias, missing-data bias, duplicated records, and timestamp mistakes.
- Keep commands, seeds, date ranges, sample sizes, and data versions reproducible.
- Prefer small isolated experiments before touching the main pipeline.
- If live systems or paid APIs are involved, use safe samples first.

### 6. Interpret Conservatively

Report:

- result against baseline
- whether it meets the predeclared success metric
- likely confounders
- operational cost or maintenance burden
- whether to continue, pause, simplify, or abandon

Negative results are useful. Preserve them when they prevent repeated dead-end work.

## Completion Report

Before finishing, state:

- hypothesis tested
- baseline used
- metric and method
- result
- limitations
- recommendation
