Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB313FB09C
	for <lists.iommu@lfdr.de>; Mon, 30 Aug 2021 07:00:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EB7B80D65;
	Mon, 30 Aug 2021 05:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sc9tZhY2yCO8; Mon, 30 Aug 2021 05:00:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E315A80D72;
	Mon, 30 Aug 2021 05:00:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BC146C000E;
	Mon, 30 Aug 2021 05:00:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64CF9C000E
 for <iommu@lists.linux-foundation.org>; Mon, 30 Aug 2021 05:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59F1260753
 for <iommu@lists.linux-foundation.org>; Mon, 30 Aug 2021 05:00:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=chromium.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aQ-S8q589yuH for <iommu@lists.linux-foundation.org>;
 Mon, 30 Aug 2021 05:00:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F90D60616
 for <iommu@lists.linux-foundation.org>; Mon, 30 Aug 2021 05:00:11 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id q68so12239237pga.9
 for <iommu@lists.linux-foundation.org>; Sun, 29 Aug 2021 22:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E5yp+iEsNoKP4WGqkNPHHksJ0ymICBTMw/Qbzp/3nIQ=;
 b=dtgCN1gMrCH1MM5IFYsxPex7XkoqcAkCNgbuhjJ8CXOkg5ZoUVoCt10oIS8Sq7+gu4
 5UBMaON9sRCC3NISL1ZbdbC8NfhrhL/be56VTemR9VthyPx1OI1SCSuTSpGO9tWiCvN8
 WMTC/coebK+x3gDB4Cs9ngJA6FHLbv30Zvi5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E5yp+iEsNoKP4WGqkNPHHksJ0ymICBTMw/Qbzp/3nIQ=;
 b=Tt5lWfpQ1SjLYi7STliHXLZvDUyZHn+gUyhjiCJpuJjM3X7lHwO3TvsklvS3+Luchd
 +zCcdwoMAAU8MqOS7BfY7yiKaIweLVHw3sInTSxqZPLXptu3a9lA9hmI9Bakk2sg4SiS
 2OwgkpOFzjz9Hz12TYoXe25go8pdWhlzfqg/cfxLCVWE/ajmeUVoCDo3F8j550n7KBNA
 xY1KsntMv8aOSNu/NwGck7pD4hGfSJtTRcnG/T/q3nbLbp6ucx26KcxEC7SD5cQOrNbv
 ogJ6m3mlaIJMnofDzMnNauCbnsOCJc1sURTTtp8F4ess2at4zgOPwI1cgHcbe8SNKjSO
 QUxw==
X-Gm-Message-State: AOAM530V+ESFmsOXTonfwp7YG7LOYyqPnykDZt+xR6qm7gwuLLrMr3pS
 4t3RkT96M1o0pnBLNEAa3dyAlA==
X-Google-Smtp-Source: ABdhPJyrbVmHeKY73nJb+cpXt0NyxJ9t9575dqYGO8C91QNfxde7wOce/4GCWNwPKyNvfVhN2ikv/w==
X-Received: by 2002:a63:e756:: with SMTP id j22mr19773617pgk.362.1630299610786; 
 Sun, 29 Aug 2021 22:00:10 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:28a5:1b9f:af1d:5542])
 by smtp.gmail.com with UTF8SMTPSA id t15sm15410999pgi.80.2021.08.29.22.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Aug 2021 22:00:10 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: Robin Murphy <robin.murphy@arm.com>,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v7 0/7] Fixes for dma-iommu swiotlb bounce buffers
Date: Mon, 30 Aug 2021 13:59:18 +0900
Message-Id: <20210830045925.4163412-1-stevensd@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
MIME-Version: 1.0
Cc: David Stevens <stevensd@google.com>, linux-kernel@vger.kernel.org,
 Tom Murphy <murphyt7@tcd.ie>, iommu@lists.linux-foundation.org,
 Rajat Jain <rajatja@google.com>, Will Deacon <will@kernel.org>
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

This patch set includes various fixes for dma-iommu's swiotlb bounce
buffers for untrusted devices.

The min_align_mask issue was found when running fio on an untrusted nvme
device with bs=512. The other issues were found via code inspection, so
I don't have any specific use cases where things were not working, nor
any concrete performance numbers.

There are two issues related to min_align_mask that this patch series
does not attempt to fix. First, it does not address the case where
min_align_mask is larger than the IOVA granule. Doing so requires
changes to IOVA allocation, and is not specific to when swiotlb bounce
buffers are used. This is not a problem in practice today, since the
only driver which uses min_align_mask is nvme, which sets it to 4096.

The second issue this series does not address is the fact that extra
swiotlb slots adjacent to a bounce buffer can be exposed to untrusted
devices whose drivers use min_align_mask. Fixing this requires being
able to allocate padding slots at the beginning of a swiotlb allocation.
This is a rather significant change that I am not comfortable making.
Without being able to handle this, there is also little point to
clearing the padding at the start of such a buffer, since we can only
clear based on (IO_TLB_SIZE - 1) instead of iova_mask.

v6 -> v7:
 - Remove unsafe attempt to clear padding at start of swiotlb buffer
 - Rewrite commit message for min_align_mask commit to better explain
   the problem it's fixing
 - Rebase on iommu/core
 - Acknowledge unsolved issues in cover letter

v5 -> v6:
 - Remove unnecessary line break
 - Remove redundant config check

v4 -> v5:
 - Fix xen build error
 - Move _swiotlb refactor into its own patch

v3 -> v4:
 - Fold _swiotlb functions into _page functions
 - Add patch to align swiotlb buffer to iovad granule
 - Combine if checks in iommu_dma_sync_sg_* functions

v2 -> v3:
 - Add new patch to address min_align_mask bug
 - Set SKIP_CPU_SYNC flag after syncing in map/unmap
 - Properly call arch_sync_dma_for_cpu in iommu_dma_sync_sg_for_cpu

v1 -> v2:
 - Split fixes into dedicated patches
 - Less invasive changes to fix arch_sync when mapping
 - Leave dev_is_untrusted check for strict iommu

David Stevens (7):
  dma-iommu: fix sync_sg with swiotlb
  dma-iommu: fix arch_sync_dma for map
  dma-iommu: skip extra sync during unmap w/swiotlb
  dma-iommu: fold _swiotlb helpers into callers
  dma-iommu: Check CONFIG_SWIOTLB more broadly
  swiotlb: support aligned swiotlb buffers
  dma-iommu: account for min_align_mask w/swiotlb

 drivers/iommu/dma-iommu.c | 188 +++++++++++++++++---------------------
 drivers/xen/swiotlb-xen.c |   2 +-
 include/linux/swiotlb.h   |   3 +-
 kernel/dma/swiotlb.c      |  11 ++-
 4 files changed, 93 insertions(+), 111 deletions(-)

-- 
2.33.0.259.gc128427fd7-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
