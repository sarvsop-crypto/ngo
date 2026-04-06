enum AppBreakpoint { phone, tablet, desktop }

AppBreakpoint breakpointOf(double width) {
  if (width >= 1100) return AppBreakpoint.desktop;
  if (width >= 700) return AppBreakpoint.tablet;
  return AppBreakpoint.phone;
}
