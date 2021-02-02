Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8702230BADE
	for <lists.iommu@lfdr.de>; Tue,  2 Feb 2021 10:25:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A83FC81AEC;
	Tue,  2 Feb 2021 09:25:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uxTSyAf94BMN; Tue,  2 Feb 2021 09:25:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 48CA686DA5;
	Tue,  2 Feb 2021 09:25:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E369C013A;
	Tue,  2 Feb 2021 09:25:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C2D0C013A
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 09:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 63CE586D92
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 09:25:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AVM02nrGPvoA for <iommu@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 09:25:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 700B881AEC
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 09:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=KVcoQAis9qpVojAZk6ftMIgV9FoGH70poOL+UM2Palk=; b=jMFN/LuTCF7Kdzd7ADLDJY8w77
 kYruwQQOCl92kCYLWcT6G6gsZ4lb6WoIq0XO5t7sMpAgU+dhvG/bxYiuBIX9anxZUA0xB16l/w/rV
 axXK9F72kAjhwioKmfXwWPyHP5mGv+XG0oCRe2YSYswVjstt4zqMuZ3X8VdtmFU4rf1Sh78YSgbQN
 NhwvcLLMpQWitqEsf+d1xQMXOkq/HuBda1CPDlG/DuD5E5sG0YVF3EAssj07IXfaGRfMO2DdprKbP
 DHG07wnBGP/nG+aiINHZ2PpxnqN3da6maJiFOCrQF3q6DnrSrGHU/B2AK6g5okQfE+ovWRdzKtiAi
 XEQZMjHA==;
Received: from [2001:4bb8:198:6bf4:7f38:755e:a6e0:73e9] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l6rw8-00Ez5i-Fu; Tue, 02 Feb 2021 09:25:30 +0000
Date: Tue, 2 Feb 2021 10:25:26 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] dma-mapping fix for 5.11
Message-ID: <YBkahgjZ1hnpplH1@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

The following changes since commit 6ee1d745b7c9fd573fba142a2efdad76a9f1cb04:

  Linux 5.11-rc5 (2021-01-24 16:47:14 -0800)

are available in the Git repository at:

  git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.11-1

for you to fetch changes up to d17405d52bacd14fe7fdbb10c0434934ea496914:

  dma-mapping: benchmark: fix kernel crash when dma_map_single fails (2021-01-27 17:18:38 +0100)

----------------------------------------------------------------
dma-mapping fix for 5.11

 - fix a kernel crash in the new dma-mapping benchmark test (Barry Song)

----------------------------------------------------------------
Barry Song (1):
      dma-mapping: benchmark: fix kernel crash when dma_map_single fails

 kernel/dma/map_benchmark.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
