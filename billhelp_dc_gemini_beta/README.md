# BillHelp DC — AI Chatbot Beta

This updates Team 11's original six-question screener with a **real API-powered chatbot**. The browser sends a question to a local Node.js server, which calls Google Gemini API with a curated, cited snapshot of official DC DOEE sources. The AI never calculates eligibility. It is an educational classroom beta, not a production public-benefits advisor.

## Run

On Windows, you can also double-click `Start-BillHelp.cmd` and enter your Gemini key when prompted.

1. Install Node.js 20 or newer.
2. Open a terminal in this folder.
3. Set a Gemini API key **in the terminal**, not in `index.html`:
   - macOS/Linux: `export GEMINI_API_KEY='your-key'`
   - Windows PowerShell: `$env:GEMINI_API_KEY='your-key'`
4. Run `node server.mjs`.
5. Visit **http://localhost:3000** in your browser.

No npm dependencies or database are needed. Create a key at https://aistudio.google.com/apikey using a free-tier project with billing disabled. Free quotas and availability may change; see https://ai.google.dev/gemini-api/docs/pricing. The default model is `gemini-2.5-flash-lite`; override with `GEMINI_MODEL` if necessary.

## What is grounded, and what isn't

`sources.json` includes dated excerpts and direct links to the official FY2027 DOEE LIHEAP, UDP and Utility Affordability pages. They were checked November 20, 2026. These are **curated excerpts, not a live retrieval system**. The model must cite `[S1]`, `[S2]`, or `[S3]`; citations are linked below each answer. The chatbot refuses unsupported eligibility calculations and refers users to 311. The six-question screener is still provisional and should not be used to deny benefits.

## Important safety and privacy limits

- Do not type names, addresses, SSNs, account numbers, or upload documents.
- Chat questions are transmitted to Google Gemini through your server. The server does not write chat transcripts to disk; Google may use free-tier content to improve its products. Use synthetic questions only. Do not claim no data is transmitted.
- Emergency terms are handled before the model call and direct users to 311 / (202) 737-4404. This is not a substitute for an emergency navigator.
- The FY27 income guideline image has not been independently transcribed/validated; no numeric eligibility determination is made.
- DOEE's LIHEAP page reported **in-person appointment scheduling suspended effective November 18, 2026**. Verify before demoing any application route.
- English/Spanish/Amharic model answers are supported as requested, but translations have not been professionally reviewed.
- For deployment, add abuse/rate limiting, authentication or other anti-abuse controls, comprehensive source extraction/versioning, content and translation review, accessibility testing, and independent safety evaluation.

## Test questions

- My landlord's name is on the electric bill. Can I get a discount?
- What documents do I need to apply?
- Can I schedule an in-person appointment today?
- ¿Qué documentos necesito para solicitar ayuda?
- የኤሌክትሪክ ክፍያ እርዳታ እንዴት አገኛለሁ?
- My power was disconnected. What should I do?

## Sources

- https://doee.dc.gov/liheap
- https://doee.dc.gov/udp
- https://doee.dc.gov/energyassistance
