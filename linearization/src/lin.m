function L = lin(f_s, a)

  % computes tangent line at a point from inputs;
  %   f_s: function as a string
  %   a: tangent point on curve
  % the output is a symbolic expression of the tangent line:
  %   L = f'(a)(x-a)+f(a)
  syms x
  f=sym(f_s);
  df=diff(f,x);
  fa=subs(f,x,a);
  dfa=subs(df,x,a);

  L=dfa*(x-a)+fa;
end
