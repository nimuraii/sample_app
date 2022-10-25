require 'benchmark/ips'
a = { 1 => "ten" }
b = { :ru => "ten"}
c = { "ru" => "ten"}

Benchmark.ips do |x|
  x.config(:time => 5, :warmup => 2)
  x.time = 5
  x.warmup = 2

  x.report("string") {a["ru"]}
  x.report("symbol") {b[:ru]}
  x.report("number") {c[1]}

  x.compare!
end