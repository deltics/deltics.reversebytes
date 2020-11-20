
{$define CONSOLE}

{$i deltics.inc}

  program test;

uses
  Deltics.Smoketest,
  Deltics.ReverseBytes in '..\src\Deltics.ReverseBytes.pas',
  Tests in 'Tests.pas';


begin
  TestRun.Test(TTests);
end.
