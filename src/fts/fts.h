// Names are needed by mozc. Values are from iOS SDK.

#define FTS_NOCHDIR 0x0004
#define FTS_NOSTAT 0x0008
#define FTS_PHYSICAL 0x0010
#define FTS_XDEV 0x0040

#define FTW_F 0
#define FTW_DNR 2
#define FTW_DP 3
#define FTW_NS 4
#define FTW_SL 5
#define FTW_SLN 6

#define FTW_PHYS 0x01
#define FTW_MOUNT 0x02
#define FTW_DEPTH 0x04

typedef void FTS;
typedef void FTSENT;

void *fts_open(void *, int, void *) {
    return 0;
}

int nftw(const void *, ...) {
    return -1;
}
