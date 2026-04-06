# Flutter UI Architecture

This app is organized to avoid frame-export anti-patterns.

## Principles
- Use Figma as visual reference, not source code.
- Build responsive primitives first, then compose pages.
- Centralize visual decisions in tokens/theme.
- Use reusable components for cards/forms/sections.
- Support dynamic states: loading, empty, error, ready.

## Structure
- `core/`
  - `app_tokens.dart`: color/spacing/shadow/radius tokens
  - `app_breakpoints.dart`: responsive breakpoints
  - `app_theme.dart`: global theme
- `data/`
  - `site_content.dart`: temporary mock content + load states
- `features/shell/`
  - `main_shell.dart`: app navigation shell (phone/tablet/desktop)
  - `app_drawer.dart`, `app_nav_item.dart`
- `features/pages/`
  - page-level composition only
- `widgets/`
  - shared primitives/components (`page_scaffold`, `responsive_section`, `adaptive_grid`, cards, form, state views)

## Next steps
1. Replace mock content with API-backed repositories.
2. Add route-based navigation (`go_router`).
3. Add localization and language switching.
4. Add widget and golden tests for responsive layouts.
5. Introduce state management (`riverpod`/`bloc`) for async sections.
