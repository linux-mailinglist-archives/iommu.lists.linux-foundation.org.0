Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F1103FAAC7
	for <lists.iommu@lfdr.de>; Wed, 13 Nov 2019 08:19:00 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 170A1CC7;
	Wed, 13 Nov 2019 07:18:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DC540CA4
	for <iommu@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 07:18:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 912A1CF
	for <iommu@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 07:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=F5dHQdVRAaTpNRp+BuVlBL9qm+RFyST7QY7CQw03Vh4=;
	b=TUJ4g+rUo104R/CBZ+5wCzOi/q
	HTPOTOzTpwhFePhYrf5p+SaLvdHPZEhtU/u4WJt++bx+hOrpaVo13X6cmI53EYiYsbvNFMf3mMc1w
	0O3ooX5m29IslHOHXmf4zjnNSLCz4GMFdGIoDEfLHKvqjtUjstJoujky9CJxbDfjq+Mpsp9Qevpf5
	ei4UqXh3WBXPhlfTAGEhl/VRUR9fpf5t5jnJGfnkh+r8MgmgPb8lRmuRWcTM/dus5SGAng95GWiYv
	vOTmNdyQapjjpjrv30GvOeCLFi8W+DGXmRICwAYQLsQTyOcSJ17qk5lVlMvOqFLk7WjlcCBql8A+o
	NrSrFKXg==;
Received: from [2001:4bb8:180:3806:c70:4a89:bc61:5] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUmvO-0008Bq-52; Wed, 13 Nov 2019 07:18:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: Muli Ben-Yehuda <mulix@mulix.org>, Jon Mason <jdmason@kudzu.us>,
	x86@kernel.org
Subject: [PATCH 3/3] x86/pci: Remove #ifdef __KERNEL__ guard from <asm/pci.h>
Date: Wed, 13 Nov 2019 08:18:36 +0100
Message-Id: <20191113071836.21041-4-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113071836.21041-1-hch@lst.de>
References: <20191113071836.21041-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

pci.h is not a UAPI header, so the __KERNEL__ ifdef is rather pointless.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/x86/include/asm/pci.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/include/asm/pci.h b/arch/x86/include/asm/pci.h
index d9e28aad2738..90d0731fdcb6 100644
--- a/arch/x86/include/asm/pci.h
+++ b/arch/x86/include/asm/pci.h
@@ -12,8 +12,6 @@
 #include <asm/pat.h>
 #include <asm/x86_init.h>
 
-#ifdef __KERNEL__
-
 struct pci_sysdata {
 	int		domain;		/* PCI domain */
 	int		node;		/* NUMA node */
@@ -118,7 +116,6 @@ void native_restore_msi_irqs(struct pci_dev *dev);
 #define native_setup_msi_irqs		NULL
 #define native_teardown_msi_irq		NULL
 #endif
-#endif  /* __KERNEL__ */
 
 /* generic pci stuff */
 #include <asm-generic/pci.h>
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
