# Recovery kernel

`kernel` is the ARM64 Image selected by `TARGET_PREBUILT_KERNEL`.
It is shared by recovery on HyperOS and AOSP ROMs; it is not taken from the
installed ROM at boot.

## Recorded binary

- SHA-256: `41041f2f2bfb194b482ceac530db11616639907f3e1a81867f6662231fdb1f57`
- Embedded build banner:

```text
Linux version 4.19.297-Uvite (codespace@codespaces-abe49b) (Android (11889484, +pgo, +bolt, +lto, +mlgo, based on r522817) clang version 18.0.1, LLD 18.0.1) #1 SMP PREEMPT Thu Jul 9 06:44:41 UTC 2026
```

The exact source commit, defconfig, build command and toolchain checksum were
not recorded with this binary. The repository README links AOSPA's SM8250
kernel repository, but that link alone does not establish this Image's source.
Do not infer a source revision from the build banner.

## Embedded config limitation

The Image contains an IKCONFIG claiming `CONFIG_EROFS_FS` is disabled, while
its binary also contains EROFS implementation symbols such as
`erofs_fill_super`. Treat that config as inconsistent provenance, not as proof
that EROFS works or fails. Do not use it as a replacement defconfig.

Before replacing the Image, record the exact source URL and commit, defconfig
and config fragments, build command, compiler version and toolchain checksum.
Keep support for both ext4 and EROFS system partitions, F2FS userdata,
fscrypt v2, inline encryption, wrapped keys, metadata encryption and Virtual
A/B snapshots. Validate with both HyperOS and AOSP ROM layouts, including an
AOSP layout without `mi_ext`.

## Verification

From the repository root:

```sh
(cd prebuilt && sha256sum -c kernel.sha256)
```

After an intentional kernel update, regenerate the checksum, update this
record, and boot-test recovery, decryption, input, display and slot handling.
A matching checksum checks identity only; it does not validate compatibility.
