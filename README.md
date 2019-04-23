Tercen utility R package

# Build rust

```bash
R -e "rustinr::rustrize()"
cd src/rustlib
cargo build
```

# Cross compilation for windows

```bash
cd src/rustlib
cross build --release --target x86_64-pc-windows-gnu
```
 