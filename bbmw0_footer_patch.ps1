
# ============================================================
# bbmw0.com footer and content update
# Run in: bbmw0-technologies folder
# ============================================================

$f = "index.html"
$c = Get-Content $f -Raw -Encoding UTF8

# 1. Update footer Products section - add VERIFIQ
$c = $c -replace '(<div class="fct"[^>]*>Products</div>[\s\S]*?<a href="https://github\.com/bbmw96/jzw-bim-ai"[^>]*>GitHub</a>)', `
'<div class="fct" data-i18n="ft_prod">Products</div>
      <a href="https://bbmw0.com/jzw-bim-ai/">JZW BIM AI</a>
      <a href="https://verifiq.bbmw0.com">VERIFIQ</a>
      <a href="https://github.com/bbmw96" target="_blank" rel="noopener">GitHub</a>'

# 2. Add Company section to footer (after Products)
$c = $c -replace '(<div class="fct"[^>]*>Products</div>[\s\S]*?</div>)([\s\n]*<div class="fct"[^>]*>)', `
'$1$2'

# 3. Update title in footer/head for both products
$c = $c -replace "stat_stds:'Standards'", "stat_stds:'Rules and Standards'"

# 4. Add Privacy and Terms to footer
$c = $c -replace '(<span data-i18n="ft_reg">Registered in England[^<]*</span>)', `
'<span data-i18n="ft_reg">Registered in England &amp; Wales</span> &nbsp;&bull;&nbsp; <a href="privacy/" style="color:var(--text3)">Privacy Policy</a>'

$c | Set-Content $f -Encoding UTF8 -NoNewline
Write-Host "Done - verify with: Select-String -Path index.html -Pattern 'VERIFIQ|Privacy Policy' | Select LineNumber,Line"
