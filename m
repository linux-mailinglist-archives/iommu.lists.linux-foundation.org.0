Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6F74C89AD
	for <lists.iommu@lfdr.de>; Tue,  1 Mar 2022 11:53:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C453E60E4E;
	Tue,  1 Mar 2022 10:53:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YWb_uKhft0IW; Tue,  1 Mar 2022 10:53:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DD19660ACE;
	Tue,  1 Mar 2022 10:53:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A179AC001A;
	Tue,  1 Mar 2022 10:53:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 60D9DC001A
 for <iommu@lists.linux-foundation.org>; Tue,  1 Mar 2022 10:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6F8B60BD4
 for <iommu@lists.linux-foundation.org>; Tue,  1 Mar 2022 10:53:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h1j8SMKeg8LJ for <iommu@lists.linux-foundation.org>;
 Tue,  1 Mar 2022 10:53:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC0F360784
 for <iommu@lists.linux-foundation.org>; Tue,  1 Mar 2022 10:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=FLoPcwp8W110QTyBUFSAYe56vwqhsB+0w1jgowBLDrQ=; b=x4Ls4LGXlw3mqit2JgZ989HyZb
 T5qpKmQGteCGW5NyuTbuloRJzt7HhHDSWBkn6XMthvcPktTNRGiMhEjm3jNCxNFXallKVQH7jYfkV
 yMP1NQbMBXexGqNGRQAxlptnMjCU6iBaEsSYx496tSDH97RR6D0tylDgXaeXfMovaKcRHhD1mlnuz
 OQ2BdFcAyA097bBGDwCVXhJV6sp+r3vCa43JaFB+f/7FaiduK6PaxwT2gDQredky9tC0CHGWz/iGt
 MF2HppH9e3IKlAYjXSzy/Ts9RTiST6h6Fjh5rDDovAP92KH/7Uv2VhH/n7QVymPp/mWYAgqqJl+PH
 rhUuKZnQ==;
Received: from [2.53.44.23] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP083-00GCvx-8y; Tue, 01 Mar 2022 10:53:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: cleanup swiotlb initialization v4
Date: Tue,  1 Mar 2022 12:52:59 +0200
Message-Id: <20220301105311.885699-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 linux-s390@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 linux-ia64@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 tboot-devel@lists.sourceforge.net, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-riscv@lists.infradead.org,
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

this series tries to clean up the swiotlb initialization, including
that of swiotlb-xen.  To get there is also removes the x86 iommu table
infrastructure that massively obsfucates the initialization path.

Git tree:

    git://git.infradead.org/users/hch/misc.git swiotlb-init-cleanup

Gitweb:

    http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/swiotlb-init-cleanup

Changes since v3:
 - fix a compilation issue on some powerpc configfs
 - fix and cleanup how forced bounce buffering is enabled for
   guest memory encryption

Changes since v2:
 - make ppc_swiotlb_flags actually work again
 - also force enable swiotlb for guest encrypted memory to cater
   to hyperv which doesn't set the host encrypted memory flag

Changes since v1:
 - skip IOMMU initialization on Xen PV kernels
 - various small whitespace / typo fixes

Diffstat:
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
