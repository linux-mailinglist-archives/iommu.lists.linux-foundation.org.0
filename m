Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADED377C90
	for <lists.iommu@lfdr.de>; Mon, 10 May 2021 08:54:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9FFC83938;
	Mon, 10 May 2021 06:54:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qfW8xpa7XJ-b; Mon, 10 May 2021 06:54:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 030928364B;
	Mon, 10 May 2021 06:54:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9C08C0001;
	Mon, 10 May 2021 06:54:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C47D3C0001
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 06:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A042960B95
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 06:54:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eW8pzbq9ptf2 for <iommu@lists.linux-foundation.org>;
 Mon, 10 May 2021 06:54:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC18B60A36
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 06:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Sq4XHMDmRvg4zOADmLFRCjprd6ygyX6pUUVYUuxn5Bo=; b=WSSiM+vF8qQ8nLXBxMp64jItAj
 C4spCPQr0Ol97iquceEOYE84KKmfSwI7TO7+9KBRnkPx8x48qRY9wU6GnbakAhMCKPkW3rG1ks0kR
 0dcvxasARFw8YnlHQqgRsZxqc/J9rjA9ya6dJ3Uhv6KfcRwrB/iqBfbMkdmJH4Y1Oc1OBeDQNCbaP
 qgEN76GRschT9ZriyDzP8TdF++5DeTN/jGQElvp6Gin3KRRcYpINUKqJlEQlRh6YI7lEi3iD67hGc
 RgUvOowwKGpj/hh+hRbvDCdOgyvmQedtlXWjsJ/1367C2qXx68cJOPe1ilfdAocYoeOp67APqnmw5
 SwgmcCtA==;
Received: from [2001:4bb8:198:fbc8:e179:16d2:93d1:8e1] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lfznr-008Lnz-JD; Mon, 10 May 2021 06:54:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: more iommu dead code removal
Date: Mon, 10 May 2021 08:53:59 +0200
Message-Id: <20210510065405.2334771-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: kvm@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 iommu@lists.linux-foundation.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Kirti Wankhede <kwankhede@nvidia.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
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

Hi all,

this is another series to remove dead code from the IOMMU subsystem,
this time mostly about the hacky code to pass an iommu device in
struct mdev_device and huge piles of support code.  All of this was
merged two years ago and (fortunately) never got used.

Note that the mdev.h changes might have minor contextual conflicts
with the pending work from Jason, but it is trivial to resolve.

Diffstat:
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |    2 
 drivers/iommu/intel/iommu.c                 |  362 ----------------------------
 drivers/iommu/intel/svm.c                   |    6 
 drivers/iommu/iommu.c                       |   57 ----
 drivers/vfio/vfio_iommu_type1.c             |  132 +---------
 include/linux/intel-iommu.h                 |   11 
 include/linux/iommu.h                       |   41 ---
 include/linux/mdev.h                        |   20 -
 8 files changed, 31 insertions(+), 600 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
