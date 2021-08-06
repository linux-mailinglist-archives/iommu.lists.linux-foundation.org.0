Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 272C63E28A8
	for <lists.iommu@lfdr.de>; Fri,  6 Aug 2021 12:35:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBCB3605FF;
	Fri,  6 Aug 2021 10:34:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i4GV8Gq2JrLx; Fri,  6 Aug 2021 10:34:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B086A606B6;
	Fri,  6 Aug 2021 10:34:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89971C000E;
	Fri,  6 Aug 2021 10:34:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84E34C000E
 for <iommu@lists.linux-foundation.org>; Fri,  6 Aug 2021 10:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E9E9401D7
 for <iommu@lists.linux-foundation.org>; Fri,  6 Aug 2021 10:34:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=chromium.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GJgWbC8w01Ev for <iommu@lists.linux-foundation.org>;
 Fri,  6 Aug 2021 10:34:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F5B740163
 for <iommu@lists.linux-foundation.org>; Fri,  6 Aug 2021 10:34:56 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 t7-20020a17090a5d87b029017807007f23so18879222pji.5
 for <iommu@lists.linux-foundation.org>; Fri, 06 Aug 2021 03:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yMrPPo91HyMQwIaJQSJYadUdAwVrHzNjmHLMXlRF+Bo=;
 b=POgz3HkCvc0xiYJXKRLuuquKaKr4AK4NaUc58zgE4tAwZMOnaWWWqWetaQQTA00s9V
 AbR+z+svqz0+NhG5LVEOZZtOLmSVigk5va0kmB5u/MdBK34ZYbyxXVHjTBEoyGGNfZEM
 K37dY/T1eTB7LUAyLEx5Ra2yBWZiP1+CuL3Og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yMrPPo91HyMQwIaJQSJYadUdAwVrHzNjmHLMXlRF+Bo=;
 b=eWeUZ1Ik+2HYRmw0k34f0d5LTIWOD85kuvrsnaZuwUh30Kj4LTJT8oMqh8eVcTj1i9
 TXPyXAw4jn7z6TXQ/rUk2KHnx0KwtknWrUqUwezXIvoo8LG/NyKixSAO6ofBZ+5w+08I
 p59lDmFrj1T4qA9/nitsteV8IKRkqwgcH+6O+la3qZzWs6YG7rfaha4hKYbELKERhtZl
 SdZZxOUgUbRlPXBoBiaItzs7clhEacq/rynviRlF+7dmqNSox4eNwxWkcFMtk0ixlQmk
 0EQjMDDJvUA6w8wOmUh6Tg9iLIlrPjfwTBFTpL9uWw6GvebZiA9P3w4sCFc8DeL39HgJ
 iVgQ==
X-Gm-Message-State: AOAM531dFXIXFR38fLXOrYzU5bOibRhR+aqHhu38Udj75EQL0A2N9JRv
 5IZn87h2svOSDz2n0vwh4m+Kzw==
X-Google-Smtp-Source: ABdhPJy1+CeG1BgNQVLMHfOJrhbRkRnOHTwoQlo77pN2h7no05bbZjWu74Vlx51Wf6KiBfv/clhfxg==
X-Received: by 2002:a17:90a:428f:: with SMTP id
 p15mr20501328pjg.75.1628246095479; 
 Fri, 06 Aug 2021 03:34:55 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:6f20:cf00:347a:afc2])
 by smtp.gmail.com with UTF8SMTPSA id n35sm11457314pgb.90.2021.08.06.03.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 03:34:55 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 0/9] Add dynamic iommu backed bounce buffers
Date: Fri,  6 Aug 2021 19:34:14 +0900
Message-Id: <20210806103423.3341285-1-stevensd@google.com>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 iommu@lists.linux-foundation.org, David Stevens <stevensd@chromium.org>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

From: David Stevens <stevensd@chromium.org>

This patch series adds support for per-domain dynamic pools of iommu
bounce buffers to the dma-iommu API. This allows iommu mappings to be
reused while still maintaining strict iommu protection.

This bounce buffer support is used to add a new config option that, when
enabled, causes all non-direct streaming mappings below a configurable
size to go through the bounce buffers. This serves as an optimization on
systems where manipulating iommu mappings is very expensive. For
example, virtio-iommu operations in a guest on a linux host require a
vmexit, involvement the VMM, and a VFIO syscall. For relatively small
DMA operations, memcpy can be significantly faster.

As a performance comparison, on a device with an i5-10210U, I ran fio
with a VFIO passthrough NVMe drive and virtio-iommu with '--direct=1
--rw=read --ioengine=libaio --iodepth=64' and block sizes 4k, 16k, 64k,
and 128k. Test throughput increased by 2.8x, 4.7x, 3.6x, and 3.6x. Time
spent in iommu_dma_unmap_(page|sg) per GB processed decreased by 97%,
94%, 90%, and 87%. Time spent in iommu_dma_map_(page|sg) decreased
by >99%, as bounce buffers don't require syncing here in the read case.
Running with multiple jobs doesn't serve as a useful performance
comparison because virtio-iommu and vfio_iommu_type1 both have big
locks that significantly limit mulithreaded DMA performance.

These pooled bounce buffers are also used for subgranule mappings with
untrusted devices, replacing the single use bounce buffers used
currently. The biggest difference here is that the new implementation
maps a whole sglist using a single bounce buffer. The new implementation
does not support using bounce buffers for only some segments of the
sglist, so it may require more copying. However, the current
implementation requires per-segment iommu map/unmap operations for all
untrusted sglist mappings (fully aligned sglists included). On a 
i5-10210U laptop with the internal NVMe drive made to appear untrusted,
fio --direct=1 --rw=read --ioengine=libaio --iodepth=64 --bs=64k showed
a statistically significant decrease in CPU load from 2.28% -> 2.17%
with the new iommu bounce buffer optimization enabled.

Each domain's buffer pool is split into multiple power-of-2 size
classes. Each class allocates a fixed number of buffer slot metadata. A
large iova range is allocated, and each slot is assigned an iova from
the range. This allows the iova to be easily mapped back to the slot,
and allows the critical section of most pool operations to be constant
time. The one exception is finding a cached buffer to reuse. These are
only separated according to R/W permissions - the use of other
permissions such as IOMMU_PRIV may require a linear search through the
cache. However, these other permissions are rare and likely exhibit high
locality, so the should not be a bottleneck in practice.

Since untrusted devices may require bounce buffers, each domain has a
fallback rbtree to manage single use buffers. This may be necessary if a
very large number of DMA operations are simultaneously in-flight, or for
very large individual DMA operations.

This patch set does not use swiotlb. There are two primary ways in which
swiotlb isn't compatible with per-domain buffer pools. First, swiotlb
allocates buffers to be compatible with a single device, whereas
per-domain buffer pools don't handle that during buffer allocation as a
single buffer may end up being used by multiple devices. Second, swiotlb
allocation establishes the original to bounce buffer mapping, which
again doesn't work if buffers can be reused. Effectively the only code
that can be shared between the two use cases is allocating slots from
the swiotlb's memory. However, given that we're going to be allocating
memory for use with an iommu, allocating memory from a block of memory
explicitly set aside to deal with a lack of iommu seems kind of
contradictory. At best there might be a small performance improvement if 
wiotlb allocation is faster than regular page allocation, but buffer
allocation isn't on the hot path anyway.

Not using the swiotlb has the benefit that memory doesn't have to be
preallocated. Instead, bounce buffers consume memory only for in-flight
dma transactions (ignoring temporarily cached buffers), which is the
smallest amount possible. This makes it easier to use bounce buffers as
an optimization on systems with large numbers of devices or in
situations where devices are unknown, since it is not necessary to try
to tune how much memory needs to be set aside to achieve good
performance without costing too much memory.

Finally, this series adds a new DMA_ATTR_PERSISTENT_STREAMING flag. This
is meant to address devices which create long lived streaming mappings
but manage CPU cache coherency without using the dma_sync_* APIs.
Currently, these devices don't function properly with swiotlb=force. The
new flag is used to bypass bounce buffers so such devices will function
when the new bounce buffer optimization is enabled. The flag is added to
the i915 driver, which creates such mappings. It can also be added to
various dma-buf implementations as an optimization, although that is not
done here.

v1 -> v2:
 - Replace existing untrusted bounce buffers with new bounce
   buffer pools. This includes significant rework to account for
   untrusted bounce buffers being required instead of an
   optimization.
 - Add flag for persistent streaming mappings.

David Stevens (9):
  Revert "iommu: Allow the dma-iommu api to use bounce buffers"
  dma-iommu: expose a few helper functions to module
  dma-iommu: bounce buffers for untrusted devices
  dma-iommu: remove extra buffer search on unmap
  dma-iommu: clear only necessary bytes
  dma-iommu: add bounce buffer pools
  dma-iommu: support iommu bounce buffer optimization
  dma-mapping: add persistent streaming mapping flag
  drm/i915: use DMA_ATTR_PERSISTENT_STREAMING flag

 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c |   4 +-
 drivers/gpu/drm/i915/i915_gem_gtt.c        |   3 +-
 drivers/iommu/Kconfig                      |  11 +
 drivers/iommu/Makefile                     |   2 +-
 drivers/iommu/dma-iommu.c                  | 268 ++++-----
 drivers/iommu/io-bounce-buffers.c          | 533 +++++++++++++++++
 drivers/iommu/io-bounce-buffers.h          |  49 ++
 drivers/iommu/io-buffer-manager.c          | 633 +++++++++++++++++++++
 drivers/iommu/io-buffer-manager.h          |  94 +++
 include/linux/dma-iommu.h                  |  12 +
 include/linux/dma-mapping.h                |  11 +
 11 files changed, 1460 insertions(+), 160 deletions(-)
 create mode 100644 drivers/iommu/io-bounce-buffers.c
 create mode 100644 drivers/iommu/io-bounce-buffers.h
 create mode 100644 drivers/iommu/io-buffer-manager.c
 create mode 100644 drivers/iommu/io-buffer-manager.h

-- 
2.32.0.605.g8dce9f2422-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
