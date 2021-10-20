Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 83060435110
	for <lists.iommu@lfdr.de>; Wed, 20 Oct 2021 19:15:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFBD282861;
	Wed, 20 Oct 2021 17:15:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MNbdFo9RC_d2; Wed, 20 Oct 2021 17:15:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0C0A582662;
	Wed, 20 Oct 2021 17:14:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA184C0022;
	Wed, 20 Oct 2021 17:14:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A80E3C000D
 for <iommu@lists.linux-foundation.org>; Wed, 20 Oct 2021 17:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E6D360B13
 for <iommu@lists.linux-foundation.org>; Wed, 20 Oct 2021 17:14:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IkeJ6-Sw9jCv for <iommu@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 17:14:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D38AF60639
 for <iommu@lists.linux-foundation.org>; Wed, 20 Oct 2021 17:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=dlA2zg6fiC2H+IJzS881hgO1rZ9WRlHQjA0SQx8l/68=; b=n7cUPV57gIINXpdjNb7An9Eso+
 SdAG4G8HgYNzVQhGwaQDR8g3FFNs1y9VYZv6t1zrrmi7dC/pVtETiabJJmbNod4l5KOUuHCgXncaa
 Qn37iQxzKV8KdgXhlNQH8xDaXirhN5rXxZR+1mVQjot6e6LwFCUdsXqXMyvSPHWr70R356rzig1S1
 eQX12I+TEbLbPQfR/vF4hTxscTosIocHd6HLpXykRl2jNQdumGAmllZzYIigyqvAqf9eXfXuyU72F
 HmFwFU/uG2Br1meu2TRpXRIe2N1FSWT0O/i9ul3eekOt+LqLIjDPzGpgPkcYjIDQnUenZu+/GWPw/
 haKXc7+Q==;
Received: from [2001:4bb8:180:8777:a130:d02a:a9b5:7d80] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdFB0-005IqL-6f; Wed, 20 Oct 2021 17:14:54 +0000
Date: Wed, 20 Oct 2021 19:14:51 +0200
From: Christoph Hellwig <hch@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] dma-mapping fixes for Linux 5.15
Message-ID: <YXBOiy+yS4pwwHeQ@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

The following changes since commit 59583f747664046aaae5588d56d5954fab66cce8:

  sparc32: page align size in arch_dma_alloc (2021-09-14 14:35:17 +0200)

are available in the Git repository at:

  git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.15-2

for you to fetch changes up to c2bbf9d1e9ac7d4fdd503b190bc1ba8a6302bc49:

  dma-debug: teach add_dma_entry() about DMA_ATTR_SKIP_CPU_SYNC (2021-10-18 12:46:45 +0200)

----------------------------------------------------------------
dma-mapping fixes for Linux 5.15

 - fix more dma-debug fallout (Gerald Schaefer, Hamza Mahfooz)
 - fix a kerneldoc warning (Logan Gunthorpe)

----------------------------------------------------------------
Gerald Schaefer (1):
      dma-debug: fix sg checks in debug_dma_map_sg()

Hamza Mahfooz (1):
      dma-debug: teach add_dma_entry() about DMA_ATTR_SKIP_CPU_SYNC

Logan Gunthorpe (1):
      dma-mapping: fix the kerneldoc for dma_map_sgtable()

 kernel/dma/debug.c   | 36 ++++++++++++++++++++----------------
 kernel/dma/debug.h   | 24 ++++++++++++++++--------
 kernel/dma/mapping.c | 24 ++++++++++++------------
 3 files changed, 48 insertions(+), 36 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
