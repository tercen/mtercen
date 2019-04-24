Tercen utility R package

# Install 

```R
devtools::install_github("tercen/mtercen", ref = "1.0.3", upgrade_dependencies = FALSE, args="--no-multiarch")
```

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
 