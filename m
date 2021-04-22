Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDEE367AD3
	for <lists.iommu@lfdr.de>; Thu, 22 Apr 2021 09:19:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF934606AA;
	Thu, 22 Apr 2021 07:19:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ERLKmmCQ2_3j; Thu, 22 Apr 2021 07:19:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0839F606A6;
	Thu, 22 Apr 2021 07:19:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7405C000B;
	Thu, 22 Apr 2021 07:19:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B3E1C000B
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 07:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0170E83D98
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 07:19:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o7AulFH1W_Lu for <iommu@lists.linux-foundation.org>;
 Thu, 22 Apr 2021 07:19:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1912283D94
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 07:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=aEdQBTMaUl2RRYZxc6tzp9x+ou0hYnPrwcHo24gdihQ=; b=jzhBxobmLoI0NNUrL8/EfTlash
 db9hFe8bub19NNsbPLexbUbQ/0Oek+2WiesnCwx+loiACq5t8ge/EL9W4DSMZFpoY87u/RPIoJkV0
 skPkrzEfku4t6XaFVhJGfYG1YSfoV53RnF9KVwcg5ui97sd7esymHU1XwRs6WoLw1zeQ/xSUREnAc
 pLvhgSOCyQ9FtJwrIeBOmivQMw3NSJjC5ztzsFnOy7RFUbjIm1NeQM1uhJ+ll3xBSMmyBBrUfwNnU
 aNTNXR8y7wle+wwoQB70hJnfC//sRMKPPOusASzTKEHs37fKR/o1nitVIKirzjTWHnkI4mspElf5g
 mAplpQhw==;
Received: from [2001:4bb8:19b:f845:15fc:cef6:715a:fb03] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lZTcS-00DRkA-CT; Thu, 22 Apr 2021 07:19:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: cleanup and fix swiotlb sizing
Date: Thu, 22 Apr 2021 09:19:14 +0200
Message-Id: <20210422071921.1428607-1-hch@lst.de>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-mips@vger.kernel.org,
 iommu@lists.linux-foundation.org, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linuxppc-dev@lists.ozlabs.org
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

based on a report from Tom that overriding the default sizing provided
by the x86 SEV code on the command line doesn't work anymore, this series
cleans up how we handle default and command line sizes for the swiotlb
buffer and then fixes the recently introduced bug in a straight-forward
way.

Diffstat:
 arch/mips/cavium-octeon/dma-octeon.c      |   16 +--------------
 arch/mips/include/asm/octeon/pci-octeon.h |    1 
 arch/mips/pci/pci-octeon.c                |    2 -
 arch/powerpc/platforms/pseries/svm.c      |   13 ++----------
 drivers/xen/swiotlb-xen.c                 |    2 -
 include/linux/swiotlb.h                   |    2 -
 kernel/dma/swiotlb.c                      |   32 +++++++++++++++---------------
 7 files changed, 25 insertions(+), 43 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
