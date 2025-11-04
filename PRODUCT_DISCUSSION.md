# 📋 Product Discussion: Article Image Feature

**Status:** 🛑 **BLOCKED - Needs Product Input**

**Branch:** `claude/readme-review-planning-011CUoQDEWV8wphf6wJhUfUN`

---

## 🎯 Purpose of This Discussion

We've completed a technical review of the article image feature implementation and discovered **critical bugs that prevent the code from working**. Before proceeding with fixes, we need product stakeholder input to ensure we build the right solution.

This is a **planning and requirements clarification phase** - no coding has been done yet.

---

## 🚨 Current Situation

### What Was Requested
Display the first image from an Article's body above its snippet text.

### What We Found
1. **3 critical bugs** that cause runtime errors
2. **Architecture issues** that violate best practices
3. **Missing product requirements** for edge cases
4. **Unclear scope** - Articles only? Or all posting types?

### Why We're Pausing
Rather than just fixing bugs, we want to ensure we implement the feature correctly based on your product vision. The technical issues suggest the requirements may not have been fully specified.

---

## ❓ Questions for Product Team (PLEASE RESPOND)

### 🔴 HIGH PRIORITY - Affects Implementation Approach

#### Q1: Scope - Which Posting Types?
**Context:** Currently only Articles display images above snippets.

- [ ] Should **Questions** also show images above snippets?
- [ ] Should **ProductReviews** also show images above snippets?
- [ ] Or keep it **Article-only**?

**Why this matters:** Affects where we put the logic and how we architect the solution.

---

#### Q2: Image Extraction Rules
**Context:** Current code only looks for images in `<figure>` tags.

- [ ] Extract **any** `<img>` tag from body?
- [ ] Extract **only** images wrapped in `<figure>` tags?
- [ ] Extract **only** images with specific CSS classes?
- [ ] Something else?

**Why this matters:** Affects parsing logic and whether existing content will work.

**Follow-up:** Do we have Articles with images NOT in `<figure>` tags? If yes, how many?

---

#### Q3: Duplicate Image Handling
**Context:** Image appears in the body HTML. If we show it above snippet, it might appear twice.

- [ ] Show image above snippet AND keep it in snippet body (duplicate)
- [ ] Show image above snippet and REMOVE it from snippet body (no duplicate)
- [ ] Show image above snippet only if it's the FIRST element in body

**Why this matters:** Affects user experience and content processing approach.

---

### 🟡 MEDIUM PRIORITY - Affects User Experience

#### Q4: Multiple Images in Article
**Context:** Confirmed we show only the first image.

- [ ] Confirm: Always show **only the first** image?
- [ ] Define "first": First in HTML source order?
- [ ] Should we prefer larger/featured images over smaller ones?

**Why this matters:** Determines selection logic.

---

#### Q5: Image Display Specifications
Please provide guidance on:

- [ ] **Size limits:** Max width? Max height?
- [ ] **Aspect ratio:** Maintain original, or crop to specific ratio?
- [ ] **Positioning:** Center, left-align, right-align?
- [ ] **Broken images:** Show placeholder, hide completely, or show alt text?
- [ ] **Loading:** Lazy load, eager load, or progressive load?

**Why this matters:** Affects front-end implementation and performance.

**Request:** Can you provide visual mockups or examples?

---

### 🟢 LOW PRIORITY - Nice to Know

#### Q6: Performance & Scale
- How many snippets typically render on one page?
  - [ ] < 10 (e.g., homepage featured articles)
  - [ ] 10-50 (e.g., category listing)
  - [ ] 50+ (e.g., search results)

**Why this matters:** Determines if we need caching or database optimization.

---

#### Q7: Legacy Content Strategy
- Do we have old Articles without proper `<figure>` tags?
  - [ ] Yes - need migration plan
  - [ ] No - all content follows current format
  - [ ] Don't know - needs content audit

**Why this matters:** Affects rollout strategy and backward compatibility.

---

## 🎨 Visual Specifications Needed

Please provide or confirm:

1. **Mockup/Screenshot:** How should the image + snippet look?
2. **Spacing:** Margin/padding around image?
3. **Responsive:** Different display on mobile vs desktop?
4. **Accessibility:** Any ARIA labels or alt text requirements?

---

## 🛣️ Proposed Path Forward

### Option A: Quick Fix (2-4 hours)
- Fix the 3 critical bugs
- Add basic tests
- **Keep current architecture** (technical debt remains)
- **Use case:** Need it working ASAP, refactor later

### Option B: Proper Refactor (1-2 days)
- Fix bugs AND architectural issues
- Move to presenter/service pattern
- Use proper HTML parser (Nokogiri)
- Comprehensive test coverage
- XSS protection
- **Use case:** Want it done right, can wait a few days

### Option C: Full Solution with Optimization (3-5 days)
- Everything in Option B, PLUS:
- Database caching of first image URL
- Content migration script for old articles
- Performance optimization for list views
- **Use case:** High-traffic feature, need performance

**Which option aligns with your timeline and priorities?**

---

## 📅 Next Steps

1. **Product Team:** Please respond to questions above (especially Q1-Q3)
2. **Engineering:** Will create technical implementation plan based on your answers
3. **Together:** Schedule 30-min alignment call if needed
4. **Engineering:** Implement chosen solution
5. **Together:** Review and deploy

---

## 📎 Additional Resources

- **Full Technical Review:** See `CODE_REVIEW.md` for detailed analysis
- **Current Implementation:**
  - Model: `app/models/posting.rb:8-39`
  - View: `app/views/postings/_render_posting_snippet.html.slim`
  - Tests: `spec/posting_spec.rb`

---

## 👥 Who Should Respond?

**Primary:** Product Manager/Owner for this feature
**Also helpful:** UX Designer, Content Strategist (for Q7)

**How to respond:**
- Check boxes above inline
- Add comments directly in this document
- Or respond via email/Slack with your answers

---

## 🕐 Timeline

**Awaiting Response By:** *(Please fill in)*

**Proposed Implementation Start:** After receiving answers

**Estimated Delivery:**
- Option A: Same day as approval
- Option B: 2 days after approval
- Option C: 5 days after approval

---

**Questions about this document?** Contact the engineering team lead.

**Want to schedule a call to discuss?** Please propose times.
