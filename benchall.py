import os
import subprocess
import sys
from pathlib import Path
import pexpect
import clp_bench
import logging

script_dir = Path(__file__).parent
data_dir = script_dir / "data"

bench_asset = os.path.abspath(sys.argv[1])

bench_target_dirs = [p for p in data_dir.iterdir() if p.is_dir()]

print("Asset:", os.path.basename(bench_asset))

for bench_target in bench_target_dirs:
    print("Target: ", os.path.basename(bench_target))
    #subprocess.Popen([f'{bench_asset}/docker_run.sh {bench_target}'])

    child = pexpect.spawn(f'{bench_asset}/docker-run.sh {bench_target}', encoding='utf-8', echo=False)
    child.expect(r'\S+')  # expect anything nonnull before continuing

    logging.disable(logging.WARNING)
    clp_bench_executor = clp_bench.load_benchmarking_assets(bench_asset)

    clp_bench.ingest(clp_bench_executor)
    logging.disable(logging.NOTSET)

    print(clp_bench_executor._ClpBenchExecutor__benchmarking_results[clp_bench.BenchmarkingMode.INGEST_MODE].compressed_size)
    #clp_bench_executor.visualize()

    print()

    child.sendline('exit')
    child.expect(pexpect.EOF)  # wait for it to close to test the next thing
